"""
ASGI config for siteweb project.

It exposes the ASGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/4.1/howto/deployment/asgi/
"""

import os
from channels.routing import ProtocolTypeRouter, URLRouter
from django.urls import path
from . import consumers
from django.core.asgi import get_asgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'siteweb.settings')

application = ProtocolTypeRouter({
    'websocket': URLRouter([
        path('ws/chat/', consumers.ChatConsumer.as_asgi()),
    ]),
})