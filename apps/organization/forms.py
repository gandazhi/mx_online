# _*_ coding:utf-8 _*_ 

from django import forms

from operation.models import UserAsk

__author__ = 'gandazhi'
__date__ = '17-7-8 下午7:32'


class UserAskForm(forms.ModelForm):

    class Meta:
        model = UserAsk
        fields = ['name', 'mobile', 'course_name']