# _*_ coding:utf-8 _*_
from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import Course
from operation.models import UserFavorite


# Create your views here.


class CoursesListView(View):
    def get(self, request):
        course = Course.objects.all().order_by('-add_time')
        current_page = 'course'
        second_page = ''
        hot_course = Course.objects.all().order_by('-click_num')[:3]

        sort = request.GET.get('sort', '')
        if sort == 'hot':
            course = course.order_by('-click_num')
            second_page = 'hot'
        elif sort == 'students':
            second_page = 'participation'
            course = course.order_by('-students')
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(course, 6, request=request)
        course_list = p.page(page)
        return render(request, 'course-list.html',
                      {'current_page': current_page, 'hot_course': hot_course, 'course_list': course_list,
                       'second_page': second_page})


class CourseDetail(View):
    def get(self, request, course_id):
        current_page = 'course'
        course = Course.objects.get(id=int(course_id))
        """课程记录点击数"""
        course.click_num += 1
        course.save()
        """判断用户是否已经收藏课程和授课机构"""
        has_courseFav = False
        has_orgFav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course.id, fav_type=1):
                has_courseFav = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2):
                has_orgFav = True
        tag = course.tag
        if tag:
            relate_course = Course.objects.filter(tag=tag)[:1]
            # if relate_course == course: 判断relate_course是否与当前课程相同，如果相同就再重新取一个
            #     relate_course = relate_course
        else:
            relate_course = []
        return render(request, 'course-detail.html', {'course': course, 'current_page': current_page,
                                                      'relate_course': relate_course, 'has_courseFav': has_courseFav,
                                                      'has_orgFav': has_orgFav})
