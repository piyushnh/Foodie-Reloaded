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

#signals


#important to post to a url
import requests

from apps.restaurants.models import MerchantProfile
from . import Checksum


# Create your views here.

@api_view(['POST'])
@permission_classes((IsAuthenticated, ))
def payment(request):

    order = request.data

    # MERCHANT_KEY = settings.PAYTM_MERCHANT_KEY
    merchant_id = order['MID']
    merchant = MerchantProfile.objects.get(id=merchant_id)
    merchant_id = merchant.paytm_merchant_id
    merchant_key = merchant.paytm_merchant_key

    bill_amount = str(order['TXN_AMOUNT'])
    order_id = str(order['ORDER_ID'])
    cust_id = order['CUST_ID']


    order_id = Checksum.__id_generator__(size=50,salt=order_id)
    cust_id = Checksum.__id_generator__(size=64,salt=cust_id)

    item = PaytmHistory.objects.create(user=request.user, ORDERID = order_id )
    print(item)

    get_lang = "/" + get_language() if get_language() else ''
    # CALLBACK_URL = settings.HOST_URL + get_lang + settings.PAYTM_CALLBACK_URL
    # CALLBACK_URL = "http://127.0.0.1:8000/restaurant/paytm/response/"
    CALLBACK_URL = "http://127.0.0.1:8000/restaurant/paytm/response/"
    # Generating unique temporary ids
    data_dict = {
                'MID':merchant_id,
                'ORDER_ID':order_id,
                'CUST_ID':cust_id,
                'TXN_AMOUNT': bill_amount,
                'WEBSITE':'WEBSTAGING',
                'INDUSTRY_TYPE_ID':'Retail',
                'CHANNEL_ID':'WEB',
                'CALLBACK_URL':CALLBACK_URL,
                'MOBILE_NO':'7777777777',
            }
    param_dict = data_dict

    param_dict['CHECKSUMHASH'] = Checksum.generate_checksum(data_dict, merchant_key)
    # param_dict['TXN_AMOUNT'] = bill_amount

    # return render(request,template_name="payment.html",context={'paytmdict':param_dict})

    # url = "https://securegw-stage.paytm.in/theia/processTransaction/"
    # r = requests.post(url,data=param_dict)

    # print(r.status_code)
    # r.raise_for_status()
    # print(r.json())
    # print(r.headers)

    return Response(param_dict,status=status.HTTP_200_OK)


@csrf_exempt
def response(request):
    print(request.user.id)
    if request.method == "POST":
        print('Response post is made')

        data_dict = {}
        for key in request.POST:
            data_dict[key] = request.POST[key]

        merchant_id = data_dict['MID']
        MERCHANT_KEY = MerchantProfile.objects.get(paytm_merchant_id = merchant_id).paytm_merchant_key
        print('Response post is made')

        order_id = data_dict['ORDERID']

        try:
            verify = Checksum.verify_checksum(data_dict, MERCHANT_KEY, data_dict['CHECKSUMHASH'])
            print(verify)

            if verify:
                paytm_history_object = PaytmHistory.objects.filter(ORDERID = order_id).update(**data_dict)
                print(paytm_history_object)
                print('Response post is made')
                print('gfgfg')
                print('gfgfg')
                print('gfgfg')
                return redirect('http://localhost:3000/foodcourts/order/response')
            else:
                return HttpResponse("checksum verify failed")

        except:
            HttpResponse('Invalid Checksum!')

    return HttpResponse(status=200)

# request_finished(response,sender=None)

@permission_classes((IsAuthenticated, ))
@api_view(['GET'])
def  order_response(request):
    order_details = PaytmHistory.objects.filter(user=request.user).last()
    order_details = PaytmHistorySerializer(order_details)

    return Response(order_details.data, status=status.HTTP_200_OK)
