from channels.generic.websocket import JsonWebsocketConsumer
import json
from asgiref.sync import async_to_sync

class OrderConsumer(JsonWebsocketConsumer):
    def connect(self):
        self.name = self.scope['url_route']['kwargs']['restaurant_id']
        self.group_name = 'restaurant_%s' % self.name

        # Join room group
        async_to_sync(self.channel_layer.group_add)(
            self.group_name,
            self.channel_name
        )

        self.accept()

    def disconnect(self, close_code):
        # Leave room group
        async_to_sync(self.channel_layer.group_discard)(
            self.group_name,
            self.channel_name
        )

    # Receive message from WebSocket
    # def receive(self, text_data):
    #     text_data_json = json.loads(text_data)
    #     message = text_data_json['message']

    #     # Send message to room group
    #     async_to_sync(self.channel_layer.group_send)(
    #         self.group_name,
    #         {
    #             'type': 'order_placed',
    #             'message': message
    #         }
    #     )

    # Receive message from room group
    def order_placed(self, event):

        print('sksu')
        order = event['order']
        print(order)

        # Send message to WebSocket
        self.send_json(content=json.dumps({
            'order': order
        }))