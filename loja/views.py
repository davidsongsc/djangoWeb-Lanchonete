from django.shortcuts import render

# Create your views here.


def loja_index(request):
    return render(request, "loja_index.html", {})