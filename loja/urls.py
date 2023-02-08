from django.urls import path, include

from .views import loja_index


urlpatterns = [
    path('index', loja_index, name="loja_index"),
]
