# -*- coding: utf-8 -*-
# Generated by Django 1.9 on 2017-07-30 19:00
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('users', '0005_auto_20170730_1713'),
    ]

    operations = [
        migrations.RenameField(
            model_name='userprofile',
            old_name='birthday',
            new_name='birth_day',
        ),
    ]
