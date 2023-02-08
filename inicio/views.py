from django.shortcuts import render
from django.http import HttpResponse
from django.http import HttpResponseRedirect
from graphene_django.views import GraphQLView
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth.decorators import login_required
from rest_framework.decorators import authentication_classes, permission_classes
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView



class ProtectedView(APIView):
    authentication_classes = [SessionAuthentication]
    permission_classes = [IsAuthenticated]

    def get(self, request):
        content = {'message': 'Hello, authenticated user!'}
        return Response(content)


@authentication_classes(SessionAuthentication)
@permission_classes((IsAuthenticated,))
class MyGraphQLView(GraphQLView):
    # Override the default context
    def get_context(self, request):
        context = super().get_context(request)
        context['user'] = request.user
        return context


def home(request):
    return HttpResponseRedirect('/index&=inicio')


pagina = None


def inicio(request):
    return render(request, 'inicio.html', {'pagina': pagina, })


def cardapio(request):
    return render(request, 'cardapio.html', {'pagina': pagina, })


@login_required
def delivery(request):
    return render(request, 'delivery.html', {'pagina': pagina, })


@login_required
def faleconosco(request):
    return render(request, 'faleconosco.html', {'pagina': pagina, })

@login_required
def logout(request):
    return HttpResponseRedirect("accounts/logout/")

def login(request):
    return render(request, 'inicio.html', {'pagina': pagina, })


def allow_origin(request):
    response = HttpResponse()
    response['Access-Control-Allow-Origin'] = 'http://localhost:3000'
    return response

