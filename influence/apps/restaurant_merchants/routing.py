from django.urls import path


from . import consumers

websocket_urlpatterns = [
    path('ws/orders/<str:restaurant_id>/', consumers.OrderConsumer),
]