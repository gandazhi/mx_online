# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2017-07-06 21:21
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='CityDict',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=20, verbose_name='\u57ce\u5e02')),
                ('desc', models.CharField(max_length=200, verbose_name='\u63cf\u8ff0')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='\u6dfb\u52a0\u65f6\u95f4')),
            ],
            options={
                'verbose_name': '\u57ce\u5e02',
                'verbose_name_plural': '\u57ce\u5e02',
            },
        ),
        migrations.CreateModel(
            name='CourseOrg',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='\u673a\u6784\u540d\u79f0')),
                ('desc', models.TextField(verbose_name='\u673a\u6784\u63cf\u8ff0')),
                ('click_num', models.IntegerField(default=0, verbose_name='\u70b9\u51fb\u6570')),
                ('fav_num', models.IntegerField(default=0, verbose_name='\u6536\u85cf\u6570')),
                ('image', models.ImageField(upload_to='org/%Y/%m', verbose_name='\u5c01\u9762\u56fe')),
                ('address', models.CharField(max_length=150, verbose_name='\u673a\u6784\u5730\u5740')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='\u6dfb\u52a0\u65f6\u95f4')),
                ('city', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='organization.CityDict', verbose_name='\u6240\u5728\u57ce\u5e02')),
            ],
            options={
                'verbose_name': '\u8bfe\u7a0b\u673a\u6784',
                'verbose_name_plural': '\u8bfe\u7a0b\u673a\u6784',
            },
        ),
        migrations.CreateModel(
            name='Teacher',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=50, verbose_name='\u6559\u5e08\u540d')),
                ('work_years', models.IntegerField(default=0, verbose_name='\u5de5\u4f5c\u5e74\u9650')),
                ('work_company', models.CharField(max_length=50, verbose_name='\u5c31\u804c\u516c\u53f8')),
                ('work_position', models.CharField(max_length=50, verbose_name='\u516c\u53f8\u804c\u4f4d')),
                ('points', models.CharField(max_length=50, verbose_name='\u6559\u5b66\u7279\u70b9')),
                ('click_num', models.IntegerField(default=0, verbose_name='\u70b9\u51fb\u6570')),
                ('fav_num', models.IntegerField(default=0, verbose_name='\u6536\u85cf\u6570')),
                ('add_time', models.DateTimeField(default=datetime.datetime.now, verbose_name='\u6dfb\u52a0\u65f6\u95f4')),
                ('org', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='organization.CourseOrg', verbose_name='\u6240\u5c5e\u673a\u6784')),
            ],
            options={
                'verbose_name': '\u6559\u5e08',
                'verbose_name_plural': '\u6559\u5e08',
            },
        ),
    ]
