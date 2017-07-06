# _*_ coding:utf-8 _*_
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.backends import ModelBackend
from django.db.models import Q
from django.urls import reverse
from django.views.generic.base import View
from django.contrib.auth.hashers import make_password
from .models import UserProfile, EmailVerifyRecord
from forms import LoginForm, RegisterForm, ForgetPwdFrom, ModifyPwdFrom
from utils.email_send import send_email

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
                return render(request, 'forgetpwd.html', {'forget_pwd': forget_pwd, 'msg': u'这个没有邮箱注册' })
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
                    return render(request, 'index.html')
                else:
                    return render(request, 'login.html', {'msg': '用户还未激活'})
            else:
                return render(request, 'login.html', {'msg': '用户名或密码错误'})
        else:
            return render(request, 'login.html', {'form': login_form})


class CustomBackend(ModelBackend):
    # 添加使用邮箱登录和使用用户名登录，重写authenticate()方法
    def authenticate(self, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class LogoutView(View):
    def get(self, request):
        logout(request)
        return HttpResponseRedirect(reverse("index"))