# _*_coding:utf-8 _*_
from django.conf.urls import url, include

from courses.views import CouresListView


urlpatterns = [

    # 课程机构列表
    url(r'^list/$', CouresListView.as_view(), name='course_list'),


]