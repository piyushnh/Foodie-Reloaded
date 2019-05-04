from django.contrib import admin
from django.urls import path
from django.conf.urls import url, include
from django.conf import settings
from . import views

from .views import (NearbyRestaurantsView, NearbyFoodCourtsView,FoodCourtRestaurantList)

urlpatterns = [
    url(r'^nearbyrestaurants/',view = NearbyRestaurantsView.as_view(),name="nearbyrestaurants" ),
    url(r'^nearbyfoodcourts/',view = NearbyFoodCourtsView.as_view() ,name="nearbyfoodcourts"),
    url(r'^foodcourt/restaurants/(?P<foodcourt_id>[\w-]+)/$',
            view = FoodCourtRestaurantList.as_view(),
             name="food_court_restaurants" ),

]
