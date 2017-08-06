# _*_ coding:utf-8 _*_
import json

from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.core.urlresolvers import reverse
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import UserProfile, EmailVerifyRecord, Banner
from operation.models import UserCourse, UserFavorite, UserMessage
from organization.models import CourseOrg, Teacher
from courses.models import Course
from forms import LoginForm, RegisterForm, ForgetPwdFrom, ModifyPwdFrom, UploadImageFrom, UserInfoFrom
from utils.email_send import send_email
from utils.mixin_utils import LoginRequiredMixin


# Create your views here.


class ResetPwdView(View):
    # 重置密码->把email传到password_reset.html中
    def get(self, request, reset_code):
        all_records = EmailVerifyRecord.objects.filter(code=reset_code)
        if all_records:
            for records in all_records:
                email = records.email
            return render(request, 'password_reset.html', {'email': email})
        else:
            return render(request, 'reset_fail.html')


class ModifyPwdView(View):
    # 重置密码逻辑
    def post(self, request):
        modify_from = ModifyPwdFrom(request.POST)
        if modify_from.is_valid():
            email = request.POST.get('email')
            new_password = request.POST.get('password', '')
            confirm_password = request.POST.get('password2', '')
            if new_password == confirm_password:
                user = UserProfile.objects.get(email=email)
                user.password = make_password(new_password)
                user.save()
                return render(request, 'login.html')
            else:
                return render(request, 'password_reset.html', {'msg': '两次密码不一致', 'email': email})
        else:
            email = request.POST.get('email')
            return render(request, 'password_reset.html', {'modify_from': modify_from, 'email': email})


class ForgetPwdView(View):
    def get(self, request):
        forget_pwd = ForgetPwdFrom()
        return render(request, 'forgetpwd.html', {'forget_pwd': forget_pwd})

    def post(self, request):
        forget_pwd = ForgetPwdFrom(request.POST)
        if forget_pwd.is_valid():
            email = request.POST.get('email', '')
            if UserProfile.objects.filter(email=email):
                # 判断是否有这个邮箱，如果有返回重置密码页，没有返回到forgetpwd.html并提示错误信息
                send_email(email, 'forget')
                return render(request, 'send_success.html')
            else:
                return render(request, 'forgetpwd.html', {'forget_pwd': forget_pwd, 'msg': u'这个没有邮箱注册'})
        else:
            # return render(request, 'login.html')
            return render(request, 'forgetpwd.html', {'forget_pwd': forget_pwd})


class ActiveUserView(View):
    # 用户激活
    def get(self, request, active_code):
        all_records = EmailVerifyRecord.objects.filter(code=active_code)
        if all_records:
            for records in all_records:
                email = records.email
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
        else:
            return render(request, 'active_fail.html')
        return render(request, 'login.html')


class RegisterView(View):
    # 注册
    def get(self, request):
        register_form = RegisterForm()
        return render(request, 'register.html', {'register_form': register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            user_name = request.POST.get('email', '')
            pass_word = request.POST.get('password', '')

            # 验证邮箱号是否注册过了
            if UserProfile.objects.filter(email=user_name):
                return render(request, 'register.html', {'register_form': register_form, 'msg': '该邮箱已经注册过了'})
            else:
                user_profile = UserProfile()
                user_profile.username = user_name
                user_profile.email = user_name
                user_profile.password = make_password(pass_word)
                user_profile.is_active = False
                user_profile.save()

                # 写如欢迎注册消息
                user_message = UserMessage()
                user_message.user = user_profile.id
                user_message.message = '欢迎注册本网站'
                user_message.save()

                send_email(user_name, 'register')
                return render(request, 'login.html')
        else:
            return render(request, 'register.html', {'register_form': register_form})


class LoginView(View):
    # 登录
    def get(self, request):
        return render(request, 'login.html', {})

    def post(self, request):
        login_form = LoginForm(request.POST)
        if login_form.is_valid():  # 验证username和password
            user_name = request.POST.get('username', '')
            pass_word = request.POST.get('password', '')
            user = authenticate(username=user_name, password=pass_word)

            if user is not None:
                if user.is_active:
                    login(request, user)
                    return HttpResponseRedirect(reverse('index'))
                else:
                    return render(request, 'login.html', {'msg': '用户还未激活'})
            else:
                return render(request, 'login.html', {'msg': '用户名或密码错误'})
        else:
            return render(request, 'login.html', {'form': login_form})


class CustomBackend(ModelBackend):
    # 添加使用邮箱登录和使用用户名登录和使用手机号码登录，重写authenticate()方法
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(email=username) | Q(mobile=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class LogoutView(View):
    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse("index"))


class UserInfoView(LoginRequiredMixin, View):
    """
    用户个人中心
    """

    def get(self, request):
        return render(request, 'usercenter-info.html')

    def post(self, request):
        user_info = UserInfoFrom(request.POST, instance=request.user)
        if user_info.is_valid():
            user_info.save()
            return HttpResponse('{"status": "success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(user_info.errors), content_type='application/json')


class UploadImageView(LoginRequiredMixin, View):
    """
    个人中心修改头像
    """

    def post(self, request):
        image_from = UploadImageFrom(request.POST, request.FILES, instance=request.user)
        if image_from.is_valid():
            image_from.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "fail"}', content_type='application/json')


class UpdatePwdView(LoginRequiredMixin, View):
    """
    个人中心修改密码
    """

    def post(self, request):
        modify_from = ModifyPwdFrom(request.POST)
        if modify_from.is_valid():
            new_password = request.POST.get('password', '')
            confirm_password = request.POST.get('password2', '')
            if new_password == confirm_password:
                user = request.user
                user.password = make_password(confirm_password)
                user.save()
                return HttpResponse('{"status": "success", "msg": "修改密码成功"}', content_type='application/json')
            else:
                return HttpResponse('{"status": "fail", "msg": "两次密码输入不一致"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(modify_from.errors), content_type='application/json')


class SendEmailCodeView(LoginRequiredMixin, View):
    """
    修改邮箱收验证码
    """

    def get(self, request):
        email = request.GET.get('email', '')
        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email": "邮箱已经被注册了"}', content_type='application/json')
        send_email(email, 'update_email')
        return HttpResponse('{"status": "success"}', content_type='application/json')


class UpdateEmailView(LoginRequiredMixin, View):
    """
    修改个人邮箱
    """

    def post(self, request):
        email = request.POST.get('email', '')
        code = request.POST.get('code', '')

        existed_records = EmailVerifyRecord.objects.filter(email=email, code=code, send_type='update_email')
        if existed_records:
            user = request.user
            user.email = email
            user.save()
            existed_records.delete()  # 修改邮箱后，从数据库中删除该条记录
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"email":"验证码出错"}', content_type='application/json')


class MyCourseView(LoginRequiredMixin, View):
    """
    我的课程
    """

    def get(self, request):
        user_course = UserCourse.objects.filter(user=request.user)
        return render(request, 'usercenter-mycourse.html', {'user_courses': user_course})


class MessageView(LoginRequiredMixin, View):
    def get(self, request):
        messages = UserMessage.objects.filter(user=request.user.id).order_by('-add_time')  # 查询出时间后，做排序，以时间倒序排序显示
        # 进入个人消息，清空自己的未读消息
        all_unread_message = messages.filter(has_read=False)
        for unread_message in all_unread_message:
            unread_message.has_read = True
            unread_message.save()

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(messages, 5, request=request)
        message = p.page(page)
        return render(request, 'usercenter-message.html', {'message': message})


class FavOrgView(LoginRequiredMixin, View):
    def get(self, request):
        org_list = []
        fav_orgs = UserFavorite.objects.filter(user=request.user, fav_type=2)
        for fav_org in fav_orgs:
            org_id = fav_org.fav_id
            org = CourseOrg.objects.get(id=org_id)
            org_list.append(org)
        return render(request, 'usercenter-fav-org.html', {'org_list': org_list})


class FavCourseView(View):
    def get(self, request):
        course_list = []
        fav_courses = UserFavorite.objects.filter(user=request.user, fav_type=1)
        for fav_course in fav_courses:
            course_id = fav_course.fav_id
            course = Course.objects.get(id=course_id)
            course_list.append(course)
        return render(request, 'usercenter-fav-course.html', {'course_list': course_list})


class FavTeacherView(View):
    def get(self, request):
        teacher_list = []
        fav_teachers = UserFavorite.objects.filter(user=request.user, fav_type=3)
        for fav_teacher in fav_teachers:
            teacher_id = fav_teacher.fav_id
            teacher = Teacher.objects.get(id=teacher_id)
            teacher_list.append(teacher)
        return render(request, 'usercenter-fav-teacher.html', {'teacher_list': teacher_list})


class IndexView(View):
    def get(self, request):
        all_baners = Banner.objects.all().order_by('index')
        course = Course.objects.filter(is_banner=False)[:6]
        banner_course = Course.objects.filter(is_banner=True)[:3]
        course_orgs = CourseOrg.objects.all()[:15]
        return render(request, 'index.html',
                      {'all_banners': all_baners, 'course': course, 'banner_course': banner_course,
                       'course_orgs': course_orgs})


def page_not_found(request):
    # 全局404处理函数
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response


def page_error(request):
    # 全局500页面
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response
