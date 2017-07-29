# _*_ coding:utf-8 _*_ 

from django.conf.urls import url, include

from users.views import UserInfoView, UploadImageView, UpdatePwdView
__author__ = 'gandazhi'
__date__ = '17-7-29 下午12:02'

urlpatterns = [
    url(r'^info/$', UserInfoView.as_view(), name='user_info'),
    url(r'upload/image', UploadImageView.as_view(), name='upload_image'),
    url(r'update/password', UpdatePwdView.as_view(), name='update_password'),
]
