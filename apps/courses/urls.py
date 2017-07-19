# _*_coding:utf-8 _*_
from django.conf.urls import url, include

from courses.views import CoursesListView, CourseDetail, CourseInfoView, CommentsView, AddCommentsView

urlpatterns = [

    # 课程机构列表
    url(r'^list/$', CoursesListView.as_view(), name='course_list'),
    url(r'^detail/(?P<course_id>\d+)/$', CourseDetail.as_view(), name='course_detail'),
    url(r'^info/(?P<course_id>\d+)/$', CourseInfoView.as_view(), name='course_info'),
    url(r'^comments/(?P<course_id>\d+)/$', CommentsView.as_view(), name='course_comments'),
    # 添加课程评论
    url(r'^add_comment/$', AddCommentsView.as_view(), name='add_comment'),
]
