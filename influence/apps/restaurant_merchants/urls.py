from django.contrib import admin
from django.urls import path
from django.urls import path
from django.conf import settings
from . import views

from .views import (merchant_login,
                    ProcessingOrdersList
                    )

urlpatterns = [
    

    path('login/',
            merchant_login ),
    path('processing_orders/<str:restaurant_id>',
            ProcessingOrdersList.as_view())

]
