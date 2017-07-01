# _*_ coding:utf-8 _*_ 

from django import forms
from captcha.fields import CaptchaField

__author__ = 'gandazhi'
__date__ = '17-6-28 下午9:36'


class LoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=5)


class RegisterForm(forms.Form):
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=5)
    captcha = CaptchaField(error_messages={'invalid': u'验证码错误'})