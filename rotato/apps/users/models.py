from django.db import models

# try:
#     from django.contrib.auth import get_user_model
#     User = get_user_model()
# except ImportError:
#     from django.contrib.auth.models import User
from django.contrib.auth.models import AbstractUser

from phonenumber_field.modelfields import PhoneNumberField
from phonenumber_field.widgets import PhoneNumberPrefixWidget

from django.db.models.signals import post_save
from django.dispatch import receiver

class CustomUser(AbstractUser):
    is_merchant = models.BooleanField(default=False)
    mobile_number = PhoneNumberField(
        blank=True,
        null = True,
        region='IN'
    )

    def __str__(self):
        return "{}".format(self.email)


# class UserProfile(models.Model):
#     user = models.OneToOneField(User, on_delete=models.CASCADE, related_name = 'profiles')
#     birth_date = models.DateField(null=True, blank=True)

# @receiver(post_save, sender=User)
# def create_user_profile(sender, instance, created, **kwargs):
#     if created:
#         UserProfile.objects.create(user=instance)

# @receiver(post_save, sender=User)
# def save_user_profile(sender, instance, **kwargs):
#     instance.profile.save()
# Create your models here.



