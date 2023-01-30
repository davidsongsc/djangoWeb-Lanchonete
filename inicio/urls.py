from django.urls import path, include
from .schema import schema
from .views import home, faleconosco, delivery, cardapio, login, inicio
from graphene_file_upload.django import FileUploadGraphQLView


urlpatterns = [
    #path('index&=<str:pagina>', central, name="central"),
    path('', home, name="inicio"),
    path('index&=inicio', inicio, name="inicio"),
    path('index&=faleconosco', faleconosco, name="faleconosco"),
    path('index&=cardapio', cardapio, name="cardapio"),
    path('index&=delivery', delivery, name="delivery"),
    path('index&=login', login, name="login"),
    path('graphql', FileUploadGraphQLView.as_view(graphiql=True))
]
