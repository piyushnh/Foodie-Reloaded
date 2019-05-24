from django.contrib import admin
from django.urls import path
from django.conf.urls import url, include
from django.conf import settings

from .views import payment, response, order_response

urlpatterns = [
    url(r'^payment/$',view = payment,name="paytm_payment" ),
    url(r'^response/$',view = response,name="paytm_response" ),
    url(r'^order_response/$',view = order_response,name="paytm_order_response" ),



]