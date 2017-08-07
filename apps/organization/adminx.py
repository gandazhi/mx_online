# _*_ coding:utf-8 _*_ 

import xadmin
from .models import CityDict, CourseOrg, Teacher

__author__ = 'gandazhi'
__date__ = '17-6-24 下午2:27'


class CityDictAdmin(object):
    list_display = ['name', 'desc', 'add_time']
    search_fields = ['name', 'desc']
    list_filter = ['name', 'desc', 'add_time']


class CourseOrgAdmin(object):
    list_display = ['name', 'desc', 'click_num', 'fav_num', 'image', 'address', 'city', 'add_time']
    search_fields = ['name', 'desc', 'click_num', 'fav_num', 'image', 'address', 'city']
    list_filter = ['name', 'desc', 'click_num', 'fav_num', 'image', 'address', 'city', 'add_time']
    relfield_style = 'fk-ajax'


class TeacherAdmin(object):
    list_display = ['name', 'org', 'work_years', 'work_company', 'work_position',
                    'points', 'click_num', 'fav_num', 'add_time']
    search_fields = ['org', 'name', 'work_years', 'work_company', 'work_position',
                     'points', 'click_num', 'fav_num']
    list_filter = ['org', 'name', 'work_years', 'work_company', 'work_position',
                   'points', 'click_num', 'fav_num', 'add_time']


xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(CourseOrg, CityDictAdmin)
xadmin.site.register(Teacher, TeacherAdmin)
