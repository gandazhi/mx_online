# _*_ coding:utf-8 _*_
from django.shortcuts import render
from django.views.generic import View

from .models import Course


# Create your views here.


class CouresListView(View):
    def get(self, request):
        course = Course.objects.all()
        current_page = 'course'
        hot_course = course.order_by('fav_num')[:3]
        return render(request, 'course-list.html', {'course': course, 'current_page': current_page,
                                                    'hot_course': hot_course})
