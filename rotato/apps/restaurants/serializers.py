from rest_framework import serializers

from .models import (Restaurant,
                    FoodCourt,
                    Menu,
                    MenuItem,
                    MenuCategory)


class RestaurantSerializer(serializers.ModelSerializer):
    class Meta:
        model = Restaurant
        fields = '__all__'

class FoodCourtSerializer(serializers.ModelSerializer):
    restaurants = RestaurantSerializer(read_only=True,many=True,) #method to include foreign relations

    class Meta:
        model = FoodCourt
        fields = '__all__'

class MenuSerializer(serializers.ModelSerializer):
    categories = RestaurantSerializer(read_only=True,many=True,) #method to include foreign relations

    class Meta:
        model = Menu
        fields = '__all__'
class FoodCourtSerializer(serializers.ModelSerializer):
    restaurants = RestaurantSerializer(read_only=True,many=True,) #method to include foreign relations

    class Meta:
        model = FoodCourt
        fields = '__all__'
class FoodCourtSerializer(serializers.ModelSerializer):
    restaurants = RestaurantSerializer(read_only=True,many=True,) #method to include foreign relations

    class Meta:
        model = FoodCourt
        fields = '__all__'
