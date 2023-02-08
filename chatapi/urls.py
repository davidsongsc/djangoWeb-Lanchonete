from django.urls import path
from graphene_file_upload.django import FileUploadGraphQLView
from .views import ChatView
from .schema import schema
from . import consumers
app_name = 'chat'
urlpatterns = [
    path('chatw/', FileUploadGraphQLView.as_view(graphiql=True, schema=schema)),
    path('chat/', ChatView.as_view(), name='chat')
    #path('chat/', ChatView.as_view(), name='chat')
]

websocket_urlpatterns = [
    path('ws/chat/', consumers.MyConsumer.as_asgi()),
]
