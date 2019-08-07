# Generated by Django 2.1.7 on 2019-08-03 16:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0022_remove_order_items'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='items',
            field=models.ManyToManyField(related_name='orders', to='restaurants.MenuItem'),
        ),
    ]