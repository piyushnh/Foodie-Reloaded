# Generated by Django 2.1.7 on 2019-04-03 17:46

from django.db import migrations
import django.db.models.manager


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelManagers(
            name='restaurant',
            managers=[
                ('gis', django.db.models.manager.Manager()),
            ],
        ),
    ]