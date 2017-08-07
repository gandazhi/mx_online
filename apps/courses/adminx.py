# _*_ coding:utf-8 _*_

import xadmin

from .models import Course, Lesson, Video, CourseResource

__author__ = 'gandazhi'
__date__ = '17-6-24 下午1:13'


class CourseAdmin(object):
    list_display = ['name', 'desc', 'detail', 'degree', 'learn_time', 'students', 'fav_num',
                    'image', 'click_num']
    search_fields = ['name', 'desc', 'detail', 'degree', 'students', 'fav_num',
                     'image', 'click_num']
    list_filter = ['name', 'desc', 'detail', 'degree', 'learn_time', 'students', 'fav_num',
                   'image', 'click_num']
    ordering = ['-click_num']  # 默认排序规则
    readonly_fields = ['click_num', 'fav_num']  # 设置不能修改的字段
    exclude = ['click_num']  # 设置不显示的字段，因为设置了readonly_fields所有exclude对click_num不生效


class LessonAdmin(object):
    list_display = ['course', 'name', 'add_time']
    search_fields = ['course', 'name']
    list_filter = ['course__name', 'name', 'add_time']


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson', 'name', 'add_time']


class CourseResourceAdmin(object):
    list_display = ['course', 'name', 'download', 'add_time']
    search_fields = ['course', 'name', 'download']
    list_filter = ['course', 'name', 'download', 'add_time']


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)
