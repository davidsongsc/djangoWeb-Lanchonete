from django.shortcuts import render
from django.http import JsonResponse
from graphene_django.views import GraphQLView
# Create your views here.

def home(request): 
    
    return render(request, 'index.html',{})


class MyGraphQLView(GraphQLView):
    # Override the default context
    def get_context(self, request):
        context = super().get_context(request)
        context['user'] = request.user
        return context
