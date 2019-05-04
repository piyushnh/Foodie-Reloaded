from rest_framework import permissions
from rest_framework.response import Response

from rest_framework.decorators import api_view
from rest_framework.generics import (
    ListAPIView,
    RetrieveAPIView,
    CreateAPIView,
    DestroyAPIView,
    UpdateAPIView
)

from django.contrib.gis.geoip2 import GeoIP2
g = GeoIP2()

from django.views.generic import ListView
from django.shortcuts import render, get_object_or_404

# from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin

from .models import Restaurant, FoodCourt
from .serializers import (RestaurantSerializer, FoodCourtSerializer)

from django.contrib.gis import measure
from django.contrib.gis import geos


# Create your views here.
def get_user_location(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0]
    else:
        ip = request.META.get('REMOTE_ADDR')

    return g.lat_lon('223.186.204.245')

class NearbyRestaurantsView(ListAPIView):
    serializer_class = RestaurantSerializer
    permission_classes = (permissions.IsAuthenticated, )


    def get_queryset(self):
        latitude, longitude = get_user_location(self.request)
        user_location = geos.fromstr("POINT(%s %s)" % (longitude, latitude))
        distance_from_point = {'km': 10}
        nearby_restaurants = Restaurant.gis.filter(location__distance_lte=(user_location, measure.D(**distance_from_point)))

        return nearby_restaurants

class NearbyFoodCourtsView(ListAPIView):
    serializer_class = FoodCourtSerializer
    permission_classes = (permissions.IsAuthenticated, )

# (13.0055, 77.5692)

    def get_queryset(self):
        # latitude, longitude = get_user_location(self.request)
        latitude, longitude = (13.0055, 77.5692);
        user_location = geos.fromstr("POINT(%s %s)" % (longitude, latitude))
        distance_from_point = {'km': 10}
        nearby_foodcourts = FoodCourt.gis.filter(location__distance_lte=(user_location, measure.D(**distance_from_point)))

        return nearby_foodcourts

class FoodCourtRestaurantList(ListAPIView):
    serializer_class = RestaurantSerializer
    permission_classes = (permissions.IsAuthenticated, )

    def get_queryset(self):
        foodcourt_id = self.kwargs['foodcourt_id']
        foodcourt = FoodCourt.objects.get(id=foodcourt_id)
        restaurants = foodcourt.restaurants
        # foodcourtserializer = FoodCourtSerializer(foodcourt,many=True) #REMEMBER to include many=True here,very important
        # restaurants = foodcourtserializer.data[0]["restaurants"]

        return restaurants

# @api_view(['GET'])
# def foodcourt_restaurant_list(request, foodcourt_id):
#     foodcourt = FoodCourt.gis.filter(id=foodcourt_id)
#     foodcourtserializer = FoodCourtSerializer(foodcourt,many=True) #REMEMBER to include many=True here,very important
#     restaurants = foodcourtserializer.data[0]["restaurants"]
#
#     return Response(foodcourtserializer.data)
