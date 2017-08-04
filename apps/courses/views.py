# _*_ coding:utf-8 _*_
from django.shortcuts import render
from django.views.generic import View
from django.db.models import Q
from django.http import HttpResponse
from pure_pagination import Paginator, EmptyPage, PageNotAnInteger

from .models import Course, CourseResource, Video
from operation.models import UserFavorite, CourseComments, UserCourse
from utils.mixin_utils import LoginRequiredMixin


# Create your views here.


class CoursesListView(View):
    def get(self, request):
        course = Course.objects.all().order_by('-add_time')
        second_page = ''
        hot_course = Course.objects.all().order_by('-click_num')[:3]

        # 课程搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            course = course.filter(Q(name__icontains=search_keywords) | Q(desc__icontains=search_keywords) | Q(
                detail__icontains=search_keywords))

        sort = request.GET.get('sort', '')
        if sort == 'hot':
            course = course.order_by('-click_num')
            second_page = 'hot'
        elif sort == 'students':
            second_page = 'participation'
            course = course.order_by('-students')
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(course, 6, request=request)
        course_list = p.page(page)
        return render(request, 'course-list.html',
                      {'hot_course': hot_course, 'course_list': course_list,
                       'second_page': second_page, 'search_keywords': search_keywords})


class CourseDetail(LoginRequiredMixin, View):
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        # 判断学习状态，已经有学习记录的就显示继续学习，没有记录的就显示开始学习
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        if user_courses:
            learn_state = '继续学习'
        else:
            learn_state = '开始学习'
        """课程记录点击数"""
        course.click_num += 1
        course.save()
        """判断用户是否已经收藏课程和授课机构"""
        has_courseFav = False
        has_orgFav = False
        if request.user.is_authenticated():
            if UserFavorite.objects.filter(user=request.user, fav_id=course.id, fav_type=1):
                has_courseFav = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2):
                has_orgFav = True
        tag = course.tag
        if tag:
            relate_course = Course.objects.filter(tag=tag)[:1]
            for e in relate_course.all():  # 判断取出relate_course_id
                relate_course_id = e.id
                if relate_course_id == course.id:  # 判断relate_course.id是否与当前课程.id相同，如果相同就再重新取一个
                    relate_course = Course.objects.filter(Q(tag=tag), ~Q(id=course_id))
        else:
            relate_course = []
        return render(request, 'course-detail.html',
                      {'course': course, 'relate_course': relate_course, 'has_courseFav': has_courseFav,
                       'has_orgFav': has_orgFav, 'learn_state': learn_state})


class CourseInfoView(LoginRequiredMixin, View):
    """课程章节信息"""

    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        course.click_num += 1
        course.save()

        # 查询用户是否已经关联了该课程
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not user_courses:
            user_course = UserCourse(user=request.user, course=course)
            user_course.save()
            course.students += 1
            course.save()

        # 先通过course_id找到有哪些用户学过这个课程，取出user_id，再根据这个user_id去取出这些id都学了哪些课，却出所有课程id，最后根据课程id筛选出课程
        user_cousers = UserCourse.objects.filter(course=course)
        user_id = [user_couser.user.id for user_couser in user_cousers]
        # 取出所有学过该课程的用户学过其他什么课
        all_user_courses = UserCourse.objects.filter(user_id__in=user_id)
        # 取出所有课程id
        course_id = [user_couser.course_id for user_couser in all_user_courses]
        relate_courses = Course.objects.filter(id__in=course_id).order_by('-click_num')[:5]

        lesson = course.lesson_set.all()
        all_resources = CourseResource.objects.filter(course=course)
        return render(request, 'course-video.html',
                      {'course': course, 'lesson': lesson, 'all_resources': all_resources,
                       'relate_courses': relate_courses, })


class CommentsView(View):
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        all_resources = CourseResource.objects.filter(course=course)
        all_comments = CourseComments.objects.filter(course=course)
        return render(request, 'course-comment.html',
                      {'course': course, 'all_resources': all_resources, 'all_comments': all_comments})


class AddCommentsView(View):
    """用户添加课程评论"""

    def post(self, request):
        if not request.user.is_authenticated():
            return HttpResponse('{"status": "fail", "msg": "用户未登录"}', content_type='application/json')

        course_id = request.POST.get('course_id', 0)
        comments = request.POST.get('comments', '')

        if course_id > 0 and comments:
            course_comments = CourseComments()
            course = Course.objects.get(id=int(course_id))
            course_comments.course = course
            course_comments.comments = comments
            course_comments.user = request.user
            course_comments.save()
            return HttpResponse('{"status": "success", "msg": "添加成功"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "fail", "msg": "添加失败"}', content_type='application/json')


class VideoPlayView(View):
    def get(self, request, video_id):
        video = Video.objects.get(id=int(video_id))
        course = video.lesson.course

        # 查询用户是否已经关联了该课程
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        if not user_courses:
            user_course = UserCourse(user=request.user, course=course)
            user_course.save()
            course.students += 1
            course.save()

        # 先通过course_id找到有哪些用户学过这个课程，取出user_id，再根据这个user_id去取出这些id都学了哪些课，却出所有课程id，最后根据课程id筛选出课程
        user_cousers = UserCourse.objects.filter(course=course)
        user_id = [user_couser.user.id for user_couser in user_cousers]
        # 取出所有学过该课程的用户学过其他什么课
        all_user_courses = UserCourse.objects.filter(user_id__in=user_id)
        # 取出所有课程id
        course_id = [user_couser.course_id for user_couser in all_user_courses]
        relate_courses = Course.objects.filter(id__in=course_id).order_by('-click_num')[:5]

        lesson = course.lesson_set.all()
        all_resources = CourseResource.objects.filter(course=course)
        return render(request, 'course-play.html',
                      {'course': course, 'lesson': lesson, 'all_resources': all_resources,
                       'relate_courses': relate_courses, 'video': video})
