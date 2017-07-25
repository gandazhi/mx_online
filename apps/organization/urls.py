# _*_ coding:utf-8 _*_ 

from django.conf.urls import url, include

from .views import OrgView, AddUserAskView, OrgHomeView, OrgCourseView, OrgDescView, OrgTeachersView, AddFavView, \
    TeacherListView, TeacherDetailView

__author__ = 'gandazhi'
__date__ = '17-7-8 下午7:41'

urlpatterns = [

    # 课程机构列表
    url(r'^list/$', OrgView.as_view(), name='org_list'),
    # 我要学习的url
    url(r'^add_ask/$', AddUserAskView.as_view(), name='add_ask'),
    url(r'^home/(?P<org_id>\d+)/$', OrgHomeView.as_view(), name='org_home'),
    url(r'^course/(?P<org_id>\d+)/$', OrgCourseView.as_view(), name='org_course'),
    url(r'^desc/(?P<org_id>\d+)/$', OrgDescView.as_view(), name='org_desc'),
    url(r'^teachers/(?P<org_id>\d+)/$', OrgTeachersView.as_view(), name='org_teachers'),
    # 收藏机构和取消收藏机构
    url(r'^add_fav/$', AddFavView.as_view(), name='add_fav'),
    # 讲师列表页
    url(r'^teacher/list/$', TeacherListView.as_view(), name='teacher_list'),
    # 讲师详情页
    url(r'^teachers/detail(?P<teacher_id>\d+)/$', TeacherDetailView.as_view(), name='teacher_detail'),
]
