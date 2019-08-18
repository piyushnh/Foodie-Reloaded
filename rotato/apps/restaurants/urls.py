from django.contrib import admin
from django.urls import path
from django.conf.urls import url, include
from django.conf import settings
from . import views

from .views import (NearbyRestaurantsView,
                    NearbyFoodCourtsView,
                    FoodCourtRestaurantList,
                    MenuItemList,
                    create_order,
                    OrderSummary,
                    )

urlpatterns = [
    url(r'^nearby/',view = NearbyRestaurantsView.as_view(),name="nearbyrestaurants" ),
    url(r'^nearbyfoodcourts/',view = NearbyFoodCourtsView.as_view() ,name="nearbyfoodcourts"),
    url(r'^foodcourt/members/(?P<foodcourt_id>[\w-]+)/$',
            view = FoodCourtRestaurantList.as_view(),
             name="food_court_restaurants" ),

    url(r'^menuitems/(?P<restaurant_id>[\w-]+)/$',
            view = MenuItemList.as_view(),
             name="menu_item_list" ),

    url(r'^order/create/$',
            view =create_order,
             name="create_order" ),

    url(r'^order_details/(?P<pk>[\w-]+)/$',
            view =OrderSummary.as_view(),
             name="order_summary" ),
             


]
