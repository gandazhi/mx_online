# _*_ coding:utf-8 _*_
from django.shortcuts import render
from django.views.generic import View

from .models import CourseOrg, CityDict

# Create your views here.


class OrgView(View):
    """
    课程机构列表功能
    """
    def get(self, request):
        all_orgs = CourseOrg.objects.all()
        all_citys = CityDict.objects.all()
        org_nums = all_orgs.count()

        return render(request, 'org-list.html', {'all_orgs': all_orgs,
                                                 'all_citys': all_citys,
                                                 'org_nums': org_nums})

    def post(self, request):
        pass