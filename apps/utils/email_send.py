# _*_ coding:utf-8 _*_
from random import Random

from django.core.mail import send_mail

from users.models import EmailVerifyRecord
from mx_online.settings import EMAIL_FROM

__author__ = 'gandazhi'
__date__ = '17-6-30 下午10:25'


def random_str(randomLength=8):
    str = ''
    chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789'
    length = len(chars) - 1
    random = Random()
    for i in range(randomLength):
        str += chars[random.randint(0, length)]
    return str


def send_email(email, send_type='register'):
    # 将发送邮件验证码的相关信息保存到数据库
    email_record = EmailVerifyRecord()
    if send_type == 'update_email':
        code = random_str(4)
    else:
        code = random_str(16)
    email_record.code = code
    email_record.email = email
    email_record.send_type = send_type
    email_record.save()

    # 向用户发送邮件
    email_title = u''
    email_body = u''

    if send_type == 'register':
        email_title = u'慕学在线网注册激活链接'
        email_body = u'请点击下面链接激活你的帐号: http://127.0.0.1:8000/active/{0}'.format(code)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif send_type == 'forget':
        email_title = u'慕学在线网重置密码链接'
        email_body = u'请点击下面链接激活你的帐号： http://127.0.0.1:8000/reset/{0}'.format(code)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
    elif send_type == 'update_email':
        email_title = u'慕学在线网重新绑定邮箱验证码'
        email_body = u'你的邮箱验证码为：{0}'.format(code)

        send_status = send_mail(email_title, email_body, EMAIL_FROM, [email])
        if send_status:
            pass
