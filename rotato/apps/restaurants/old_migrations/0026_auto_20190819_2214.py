# Generated by Django 2.1.7 on 2019-08-19 22:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('restaurants', '0025_quantity_order'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='order_id',
            field=models.UUIDField(primary_key=True, serialize=False),
        ),
    ]