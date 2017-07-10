# _*_ coding:utf-8 _*_
from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponse

from .models import CourseOrg, CityDict
from .forms import UserAskForm
from courses.models import Course

# Create your views here.


class OrgView(View):
    """
    课程机构列表功能
    """
    def get(self, request):
        all_orgs = CourseOrg.objects.all()
        all_citys = CityDict.objects.all()
        hot_orgs = all_orgs.order_by('-click_num')[:3]

        # 城市筛选
        city_id = request.GET.get('city', '')
        if city_id:
            all_orgs = CourseOrg.objects.filter(city_id=int(city_id))

        # 类别筛选
        ct = request.GET.get('ct', '')
        if ct:
            all_orgs = CourseOrg.objects.filter(category=ct)

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
        return render(request, 'org-list.html', {'all_orgs': orgs,
                                                 'all_citys': all_citys,
                                                 'org_nums': org_nums,
                                                 'city_id': city_id,
                                                 'category': ct,
                                                 'hot_orgs': hot_orgs,
                                                 'sort': sort})


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
        current_page = 'home'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()[:3]
        all_teachers = course_org.teacher_set.all()[:1]

        return render(request, 'org-detail-homepage.html', {'all_courses': all_courses,
                                                            'all_teachers': all_teachers,
                                                            'course_org': course_org,
                                                            'current_page': current_page})


class OrgCourseView(View):
    """
    机构课程列表页
    """
    def get(self, request, org_id):
        current_page = 'course'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()
        return render(request, 'org-detail-course.html', {'all_courses': all_courses,
                                                            'course_org': course_org,
                                                          'current_page': current_page})


class OrgDescView(View):
    """
    机构介绍页
    """
    def get(self, request, org_id):
        current_page = 'desc'
        course_org = CourseOrg.objects.get(id=int(org_id))
        return render(request, 'org-detail-desc.html', {'course_org': course_org,
                                                        'current_page': current_page})


class OrgTeachersView(View):
    """
    机构讲师页
    """
    def get(self, request, org_id):
        current_page = 'teachers'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_teachers = course_org.teacher_set.all()

        return render(request, 'org-detail-teachers.html', {'all_teachers': all_teachers,
                                                            'course_org': course_org,
                                                            'current_page': current_page})