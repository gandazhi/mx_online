# _*_ coding:utf-8 _*_
from django.shortcuts import render
from django.views.generic import View
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import CourseOrg, CityDict

# Create your views here.


class OrgView(View):
    """
    课程机构列表功能
    """
    def get(self, request):
        all_orgs = CourseOrg.objects.all()
        all_citys = CityDict.objects.all()
        hot_orgs = all_orgs.order_by('-click_num')[:3]

        # 城市筛选
        city_id = request.GET.get('city', '')
        if city_id:
            all_orgs = CourseOrg.objects.filter(city_id=int(city_id))

        # 类别筛选
        ct = request.GET.get('ct', '')
        if ct:
            all_orgs = CourseOrg.objects.filter(category=ct)

        # 排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'study_nums':
                all_orgs = all_orgs.order_by('-study_nums')
            elif sort == 'course_nums':
                all_orgs = all_orgs.order_by('-course_nums')

        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_orgs, 5, request=request)
        orgs = p.page(page)

        org_nums = all_orgs.count()
        return render(request, 'org-list.html', {'all_orgs': orgs,
                                                 'all_citys': all_citys,
                                                 'org_nums': org_nums,
                                                 'city_id': city_id,
                                                 'category': ct,
                                                 'hot_orgs': hot_orgs,
                                                 'sort': sort})

    def post(self, request):
        pass