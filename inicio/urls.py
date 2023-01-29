from django.urls import path, include
from .schema import schema
from .views import home
from graphene_file_upload.django import FileUploadGraphQLView
urlpatterns = [
    path('', home, name="inicio"),
    path('graphql', FileUploadGraphQLView.as_view(graphiql=True))
]