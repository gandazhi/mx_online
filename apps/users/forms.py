# _*_ coding:utf-8 _*_ 

from django import forms

__author__ = 'gandazhi'
__date__ = '17-6-28 下午9:36'


class LoginForm(forms.Form):
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=5)