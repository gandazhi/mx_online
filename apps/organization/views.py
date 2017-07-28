# _*_ coding:utf-8 _*_
from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse
from django.db.models import Q

from .models import CourseOrg, CityDict, Teacher
from .forms import UserAskForm
from courses.models import Course
from operation.models import UserFavorite


# Create your views here.


class OrgView(View):
    """
    课程机构列表功能
    """

    def get(self, request):
        all_orgs = CourseOrg.objects.all()
        all_citys = CityDict.objects.all()
        hot_orgs = all_orgs.order_by('-click_num')[:3]

        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_orgs = all_orgs.filter(Q(name__icontains=search_keywords) | Q(desc__icontains=search_keywords))

        # 城市筛选
        city_id = request.GET.get('city', '')
        if city_id:
            all_orgs = CourseOrg.objects.filter(city_id=int(city_id))

        # 类别筛选
        ct = request.GET.get('ct', '')
        if ct:
            all_orgs = all_orgs.filter(category=ct)

        # 排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'study_nums':
                all_orgs = all_orgs.order_by('-study_nums')
            elif sort == 'course_nums':
                all_orgs = all_orgs.order_by('-course_nums')

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_orgs, 5, request=request)
        orgs = p.page(page)

        org_nums = all_orgs.count()
        return render(request, 'org-list.html',
                      {'all_orgs': orgs, 'all_citys': all_citys, 'org_nums': org_nums, 'city_id': city_id,
                       'category': ct, 'hot_orgs': hot_orgs, 'sort': sort, 'search_keywords': search_keywords})


class AddUserAskView(View):
    """
    用户添加咨询
    """

    def post(self, request):
        userask_Form = UserAskForm(request.POST)
        if userask_Form.is_valid():
            user_ask = userask_Form.save(commit=True)
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            print userask_Form.errors
            return HttpResponse('{"status":"fail", "msg": "提交错误"}', content_type='application/json')


class OrgHomeView(View):
    def get(self, request, org_id):
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        all_courses = course_org.course_set.all()[:3]
        all_teachers = course_org.teacher_set.all()[:1]

        return render(request, 'org-detail-homepage.html', {'all_courses': all_courses,
                                                            'all_teachers': all_teachers,
                                                            'course_org': course_org,
                                                            'has_fav': has_fav})


class OrgCourseView(View):
    """
    机构课程列表页
    """

    def get(self, request, org_id):
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        all_courses = course_org.course_set.all()
        return render(request, 'org-detail-course.html', {'all_courses': all_courses,
                                                          'course_org': course_org,
                                                          'has_fav': has_fav})


class OrgDescView(View):
    """
    机构介绍页
    """

    def get(self, request, org_id):
        current_page = 'desc'
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'org-detail-desc.html', {'course_org': course_org,
                                                        'current_page': current_page,
                                                        'has_fav': has_fav})


class OrgTeachersView(View):
    """
    机构讲师页
    """

    def get(self, request, org_id):
        course_org = CourseOrg.objects.get(id=int(org_id))
        has_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        all_teachers = course_org.teacher_set.all()

        return render(request, 'org-detail-teachers.html', {'all_teachers': all_teachers,
                                                            'course_org': course_org,
                                                            'has_fav': has_fav})


class AddFavView(View):
    """
    用户收藏，取消收藏
    """

    def post(self, request):
        fav_id = request.POST.get('fav_id', 0)
        fav_type = request.POST.get('fav_type', 0)

        if not request.user.is_authenticated():
            return HttpResponse('{"status":"fail","msg":"用户未登录"}', content_type='application/json')

        exist_records = UserFavorite.objects.filter(user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
        if exist_records:
            # 如果记录已经存在，就删除该记录，取消收藏
            exist_records.delete()
            return HttpResponse('{"status":"success","msg":"收藏"}', content_type='application/json')
        else:
            # 否则就加入收藏信息，收藏该机构
            user_fav = UserFavorite()
            if int(fav_id) > 0 and int(fav_type) > 0:
                user_fav.fav_id = int(fav_id)
                user_fav.fav_type = int(fav_type)
                user_fav.user = request.user
                user_fav.save()
                return HttpResponse('{"status":"success","msg":"已收藏"}', content_type='application/json')
            else:
                return HttpResponse('{"status":"fail","msg":"收藏错误"}', content_type='application/json')


class TeacherListView(View):
    """
    课程讲师列表页
    """

    def get(self, request):
        tag = ''
        teacher = Teacher.objects.all()
        ranking_teacher = teacher.order_by('-fav_num')[:3]

        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            teacher = teacher.filter(
                Q(name__icontains=search_keywords) | Q(work_company__icontains=search_keywords) | Q(
                    work_position__icontains=search_keywords))

        sort = request.GET.get('sort', '')
        if sort == 'hot':
            teacher = teacher.order_by('-click_num')
            tag = 'hot'
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(teacher, 2, request=request)
        teacher_list = p.page(page)

        teacher_nums = teacher.count()

        return render(request, 'teachers-list.html',
                      {'teacher_list': teacher_list, 'teacher_nums': teacher_nums, 'ranking_teacher': ranking_teacher,
                       'tag': tag, 'search_keywords': search_keywords})


class TeacherDetailView(View):
    def get(self, request, teacher_id):
        teacher = Teacher.objects.get(id=int(teacher_id))
        all_courses = Course.objects.filter(teacher=teacher)
        ranking_teacher = Teacher.objects.all().order_by('-fav_num')[:3]
        has_teacher_fav = False
        has_org_fav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher.id, fav_type=3):
                has_teacher_fav = True
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher.org.id, fav_type=2):
                has_org_fav = True
        return render(request, 'teacher-detail.html',
                      {'teacher': teacher, 'all_courses': all_courses, 'ranking_teacher': ranking_teacher,
                       'has_teacher_fav': has_teacher_fav, 'has_org_fav': has_org_fav})
