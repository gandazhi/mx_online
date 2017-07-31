# _*_ coding:utf-8 _*_ 

from django.conf.urls import url, include

from users.views import UserInfoView, UploadImageView, UpdatePwdView, SendEmailCodeView, UpdateEmailView, MyCourseView
__author__ = 'gandazhi'
__date__ = '17-7-29 下午12:02'

urlpatterns = [
    url(r'^info/$', UserInfoView.as_view(), name='user_info'),
    url(r'^upload/image/$', UploadImageView.as_view(), name='upload_image'),
    url(r'^update/password/$', UpdatePwdView.as_view(), name='update_password'),
    url(r'^send_email_code/$', SendEmailCodeView.as_view(), name='send_email_code'),
    url(r'^update_email/$', UpdateEmailView.as_view(), name='update_email'),
    url(r'^my_course', MyCourseView.as_view(), name='my_course'),
]
