# _*_ coding:utf-8 _*_
from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import Course


# Create your views here.


class CouresListView(View):
    def get(self, request):
        course = Course.objects.all()
        current_page = 'course'
        second_page = ''
        hot_course = course.order_by('fav_num')[:3]

        sort = request.GET.get('sort', '')
        if sort == 'hot':
            course = course.order_by('-fav_num')
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

        return render(request, 'course-detail.html', {'course': course})
