# -*- coding: utf-8 -*-
# Generated by Django 1.10.5 on 2017-07-11 10:43
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0005_teacher_image'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='courseorg',
            name='course_nums',
        ),
    ]