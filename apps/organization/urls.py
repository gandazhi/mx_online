# _*_ coding:utf-8 _*_ 

from django.conf.urls import url, include

from .views import OrgView, AddUserAskView, OrgHomeView, OrgCourseView, OrgDescView, OrgTeachersView

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

]