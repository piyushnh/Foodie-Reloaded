# Generated by Django 2.1.7 on 2019-08-02 20:37

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('paytm', '0004_auto_20190802_2032'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='merchantprofile',
            name='id',
        ),
        migrations.AlterField(
            model_name='merchantprofile',
            name='mid',
            field=models.CharField(max_length=20, primary_key=True, serialize=False, unique=True),
        ),
    ]
