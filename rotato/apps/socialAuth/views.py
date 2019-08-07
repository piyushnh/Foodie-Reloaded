from django.conf import settings

from rest_framework import serializers
from rest_framework import status
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response

from requests.exceptions import HTTPError
from django.shortcuts import redirect
from social_django.utils import psa

from apiclient import discovery
import httplib2
import google.oauth2.credentials
import google_auth_oauthlib.flow

from oauth2client import client
# from oauth2client.contrib.django_util.storage import DjangoORMStorage



import os
import json

CLIENT_SECRETS_FILE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "client_secret.json")
SCOPES = ['https://www.googleapis.com/auth/drive.appdata', 'profile', 'email']

@api_view()
@permission_classes([AllowAny])
def exchange_auth_code(request):
                # Create flow instance to manage the OAuth 2.0 Authorization Grant Flow steps.
        flow = google_auth_oauthlib.flow.Flow.from_client_secrets_file(
            CLIENT_SECRETS_FILE, scopes=SCOPES)

        # The URI created here must exactly match one of the authorized redirect URIs
        # for the OAuth 2.0 client, which you configured in the API Console. If this
        # value doesn't match an authorized URI, you will get a 'redirect_uri_mismatch'
        # error.
        flow.redirect_uri = "http://localhost:8000/auth/social/exchange_auth/"

        authorization_url, state = flow.authorization_url(
            # Enable offline access so that you can refresh an access token without
            # re-prompting the user for permission. Recommended for web server apps.
            access_type='offline',
            # Enable incremental authorization. Recommended as a best practice.
            include_granted_scopes='true')

        # Store the state so the callback can verify the auth server response.
        request.session['state'] = state
        return redirect(authorization_url)


@api_view(['POST'])
@permission_classes([AllowAny])
def exchange_auth_code(request):
        print(request.data)
    #     # if not request.headers.get('X-Requested-With'):
    #     #     abort(403)

    #     auth_code = request.data['code']

    #     # Set path to the Web application client_secret_*.json file you downloaded from the
    #     # Google API Console: https://console.developers.google.com/apis/credentials

        
    #     # Exchange auth code for access token, refresh token, and ID token
    #     # credentials = client.credentials_from_clientsecrets_and_code(
    #     #     CLIENT_SECRET_FILE,
    #     #     ['https://www.googleapis.com/auth/drive.appdata', 'profile', 'email'],
    #     #     auth_code)

    #     flow = google_auth_oauthlib.flow.Flow.from_client_secrets_file(
    #   CLIENT_SECRET_FILE, scopes=SCOPES )
    #     flow.redirect_uri='postmessage'

    #     # access_token = credentials.token_response['access_token']
    #     flow.fetch_token(code=auth_code)
    #     credentials = flow.credentials

    #     # Call Google API
    #     # http_auth = credentials.authorize(httplib2.Http())
    #     # drive_service = discovery.build('drive', 'v3', http=http_auth)
    #     # appfolder = drive_service.files().get(fileId='appfolder').execute()

    #     # Get profile info from ID token
    #     # userid = credentials.id_token['sub']
    #     # email = credentials.id_token['email']

    #     request.session['credentials'] = credentials

    #     # credentials = json.dumps(credentials)
    #     # response = redirect('exchange_token', backend='google-oauth2')

    #     # return response
    #     return Response(credentials.to_json(),status=status.HTTP_200_OK)

            # Specify the state when creating the flow in the callback so that it can
        # verified in the authorization server response.
        # state = request.session['state']

        flow = google_auth_oauthlib.flow.Flow.from_client_secrets_file(
            CLIENT_SECRETS_FILE, scopes=None)
        flow.redirect_uri = "postmessage"

        # Use the authorization server's response to fetch the OAuth 2.0 tokens.
        auth_code = request.data['code']
        flow.fetch_token(code = auth_code)

        # Store credentials in the session.
        # ACTION ITEM: In a production app, you likely want to save these
        #              credentials in a persistent database instead.
        credentials = flow.credentials
        # request.session['credentials'] = credentials

        return Response('kjniu',status=status.HTTP_200_OK)




class SocialSerializer(serializers.Serializer):
    """
    Serializer which accepts an OAuth2 access token.
    """
    access_token = serializers.CharField(
        allow_blank=False,
        trim_whitespace=True,
    )


@api_view(http_method_names=['POST'])
@permission_classes([AllowAny])
@psa()
def exchange_token(request, backend):
    """
    Exchange an OAuth2 access token for one for this site.
    This simply defers the entire OAuth2 process to the front end.
    The front end becomes responsible for handling the entirety of the
    OAuth2 process; we just step in at the end and use the access token
    to populate some user identity.
    The URL at which this view lives must include a backend field, like:
        url(API_ROOT + r'social/(?P<backend>[^/]+)/$', exchange_token),
    Using that example, you could call this endpoint using i.e.
        POST API_ROOT + 'social/facebook/'
        POST API_ROOT + 'social/google-oauth2/'
    Note that those endpoint examples are verbatim according to the
    PSA backends which we configured in settings.py. If you wish to enable
    other social authentication backends, they'll get their own endpoints
    automatically according to PSA.
    ## Request format
    Requests must include the following field
    - `access_token`: The OAuth2 access token provided by the provider
    """
    serializer = SocialSerializer(data=request.data)
    if serializer.is_valid(raise_exception=True):
        # set up non-field errors key
        # http://www.django-rest-framework.org/api-guide/exceptions/#exception-handling-in-rest-framework-views
        try:
            nfe = settings.NON_FIELD_ERRORS_KEY
        except AttributeError:
            nfe = 'non_field_errors'

        try:
            # this line, plus the psa decorator above, are all that's necessary to
            # get and populate a user object for any properly enabled/configured backend
            # which python-social-auth can handle.
            user = request.backend.do_auth(serializer.validated_data['access_token'])
        except HTTPError as e:
            # An HTTPError bubbled up from the request to the social auth provider.
            # This happens, at least in Google's case, every time you send a malformed
            # or incorrect access key.
            return Response(
                {'errors': {
                    'token': 'Invalid token',
                    'detail': str(e),
                }},
                status=status.HTTP_400_BAD_REQUEST,
            )

        if user:
            if user.is_active:
                token, _ = Token.objects.get_or_create(user=user)
                return Response({'token': token.key})
            else:
                # user is not active; at some point they deleted their account,
                # or were banned by a superuser. They can't just log in with their
                # normal credentials anymore, so they can't log in with social
                # credentials either.
                return Response(
                    {'errors': {nfe: 'This user account is inactive'}},
                    status=status.HTTP_400_BAD_REQUEST,
                )
        else:
            # Unfortunately, PSA swallows any information the backend provider
            # generated as to why specifically the authentication failed;
            # this makes it tough to debug except by examining the server logs.
            return Response(
                {'errors': {nfe: "Authentication Failed"}},
                status=status.HTTP_400_BAD_REQUEST,
            )
