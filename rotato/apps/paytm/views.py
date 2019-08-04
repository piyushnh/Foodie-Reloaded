from django.shortcuts import render
from django.shortcuts import render
from django.http import HttpResponse
from django.utils.translation import get_language
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
from rest_framework.response import Response

from .serializers import PaytmHistorySerializer


from rest_framework import permissions
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from .models import PaytmHistory
from django.shortcuts import redirect
import requests
import json

#signals


#important to post to a url
import requests

from .models import MerchantProfile
from . import Checksum


# Create your views here.

@api_view(['POST'])
@permission_classes((IsAuthenticated, ))
def initiatePayment(request):

    try: 

            order = request.data
            
            merchant_id = str(order['restaurant']['paytm_merchant'])
            order_id = str(order['order_id'])
            merchant_key = str(MerchantProfile.objects.get(merchant_id = merchant_id).key)

            

        
            
            #******************In case we wanna do custom checkout
            #refer to this https://developer.paytm.com/docs/v1/custom-checkout/ ***********************
            # params = {
            #     "body":{
            #     "requestType": "Payment",
            #     "orderId": order_id,
            #     "websiteName":"WEBSTAGING",
            #     "mid": merchant_id,
            #     "txnAmount": {
            #         "value": str(order['amount']),
            #         "currency": "INR"
            #     },    
            #     "userInfo": {"custId":str(order['customer']) },
                
            #     }
            

            # }
            # params["head"] = {
            #  "channelId": "WAP",
            # "signature"	: checksum
            # }
            item = PaytmHistory.objects.create(customer=request.user, ORDERID = order_id )
            callback_url = "http://127.0.0.1:8000/paytm/response/"

            paytmParams = {
                    'MID':merchant_id,
                    'ORDER_ID':order_id,
                    'CUST_ID':str(order['customer']),
                    'TXN_AMOUNT': str(order['amount']),
                    'WEBSITE':'WEBSTAGING',
                    'INDUSTRY_TYPE_ID':'Retail',
                    'CHANNEL_ID':'WEB',
                    'CALLBACK_URL':callback_url,
                    'MOBILE_NO':'7777777777',
                }

        
            # checksum =  Checksum.generate_checksum_by_str(json.dumps(params["body"]), merchant_key)
            paytmParams['CHECKSUMHASH'] =  Checksum.generate_checksum(paytmParams, merchant_key)
            

            return Response(paytmParams,status=status.HTTP_200_OK)
    except:
            return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)



@csrf_exempt
@api_view(['POST'])
def response(request):

        data_dict = {}
        for key in request.POST:
            data_dict[key] = request.POST[key]

        merchant_id = data_dict['MID']
        MERCHANT_KEY = MerchantProfile.objects.get(merchant_id = merchant_id).key

        order_id = data_dict['ORDERID']

        try:
            verify = Checksum.verify_checksum(data_dict, MERCHANT_KEY, data_dict['CHECKSUMHASH'])

            if verify:
                paytm_history_object = PaytmHistory.objects.filter(ORDERID = order_id).update(**data_dict)
                return redirect('http://localhost:3000/foodcourts/order/response')
            else:
                return HttpResponse("checksum verify failed")

        except:
            HttpResponse('Invalid Checksum!')

        return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# request_finished(response,sender=None)

@permission_classes((IsAuthenticated, ))
@api_view(['GET'])
def  order_response(request):
    try:
        order_details = PaytmHistory.objects.filter(customer=request.user).last()
        order_details = PaytmHistorySerializer(order_details)

        return Response(order_details.data, status=status.HTTP_200_OK)
    except:
        return Response(status=status.HTTP_500_INTERNAL_SERVER_ERROR)

