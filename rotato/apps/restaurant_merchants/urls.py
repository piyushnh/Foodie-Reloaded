from django.contrib import admin
from django.urls import path
from django.conf.urls import url, include
from django.conf import settings
from . import views

from .views import (merchant_login,
                    
                    )

urlpatterns = [
    

    url(r'^login/$',
            view =merchant_login,
             name="merchant_login" ),

]
