# Generated by Django 2.1.7 on 2019-08-03 16:11

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0023_order_items'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='quantity',
            name='order',
        ),
    ]
