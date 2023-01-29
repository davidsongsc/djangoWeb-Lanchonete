import graphene
from graphene_django import DjangoObjectType
from .models import Produtos

class ProdutoType(DjangoObjectType):
    class Meta:
        model = Produtos

class Query(graphene.ObjectType):
    produtos = graphene.List(ProdutoType)

    def resolve_produtos(self, info, **kwargs):
        return Produtos.objects.all()

schema = graphene.Schema(query=Query)