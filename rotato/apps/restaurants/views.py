from rest_framework import permissions
from rest_framework.response import Response
from rest_framework import status
from rest_framework.mixins import RetrieveModelMixin
from django.contrib.auth.decorators import login_required
from rest_framework.permissions import IsAuthenticated
from django.core import serializers


from rest_framework.decorators import api_view, permission_classes
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

from .models import Restaurant, FoodCourt, Order
from .serializers import (RestaurantSerializer, FoodCourtSerializer,
MenuSerializer,MenuCategorySerializer, MenuItemSerializer, OrderSerializer)

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

class MenuItemList(ListAPIView):
    serializer_class = MenuCategorySerializer
    permission_classes = (permissions.IsAuthenticated, )

    def get_queryset(self):
        restaurant_id = self.kwargs['restaurant_id']
        restaurant = Restaurant.objects.get(id=restaurant_id)
        menu = restaurant.menu.first()
        categories = menu.categories
        # items = categories.first().items

        return categories

# @login_required
@api_view(['POST'])
@permission_classes((IsAuthenticated, ))
def create_order(request):
    """
    List all code snippets, or create a new snippet.
    """

    if request.method == 'POST':
        cart=request.data
        restaurant_id = cart['restaurant']['id']
        amount = 0
        restaurant = Restaurant.objects.get(id = restaurant_id)
        # serializer = SnippetSerializer(data=request.data)
        order = Order(customer=request.user, restaurant=restaurant)
       
        order.save()



        for element in cart['orderList']:
            item = element['item']
            amount += item['price'] * element['quantity']

            order.items.add(item['id'])
            order.quantities.create(number = element['quantity'])

        order.amount = amount
        order.save()



        order = OrderSerializer(order)
        # order = OrderSerializer(order, many=True)


        # if !order:
        #     return Response(status=status.HTTP_400_BAD_REQUEST)
            # return Response(serializer.data, status=status.HTTP_201_CREATED)
        # content = {'please move along': 'nothing to see here'}
        return Response(order.data,status=status.HTTP_201_CREATED)

class OrderSummary(RetrieveAPIView):
    queryset = Order.objects.all()
    serializer_class = OrderSerializer
    permission_classes = (permissions.IsAuthenticated, )




# @api_view(['GET'])
# def foodcourt_restaurant_list(request, foodcourt_id):
#     foodcourt = FoodCourt.gis.filter(id=foodcourt_id)
#     foodcourtserializer = FoodCourtSerializer(foodcourt,many=True) #REMEMBER to include many=True here,very important
#     restaurants = foodcourtserializer.data[0]["restaurants"]
#
#     return Response(foodcourtserializer.data)
