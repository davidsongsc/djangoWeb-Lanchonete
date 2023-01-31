"""
Este código define um esquema GraphQL para
um modelo Django chamado "Produtos".

"""

import graphene
from graphene_django import DjangoObjectType
from .models import Produtos, Mostruario, GrupoProduto


class ProdutoType(DjangoObjectType):
    """
    Um tipo personalizado "ProdutoType" é 
    criado usando o DjangoObjectType que 
    mapeia  o  modelo "Produtos" para um 
    tipo de  objeto  GraphQL.  A  classe 
    "Meta" dentro de "ProdutoType" define
    o  atributo  "model" como "Produtos".

    """
    class Meta:
        model = Produtos


class MostruarioType(DjangoObjectType):
    class Meta:
        model = Mostruario


class GrupoType(DjangoObjectType):
    class Meta:
        model = GrupoProduto


class Query(graphene.ObjectType):
    """
    A classe "Query" define as consultas 
    disponíveis no esquema. Neste caso, 
    uma única consulta "produtos" é 
    definida que retorna uma lista de 
    objetos "ProdutoType". A função de 
    resolução "resolve_produtos" é a 
    função de resolução que retorna 
    todos os objetos "Produtos" do 
    modelo Django.

    """
    favoritos = graphene.List(MostruarioType)

    bebidas = graphene.List(
        ProdutoType, tipo=graphene.String(default_value='bebidas'))
    hamburguers = graphene.List(
        ProdutoType, tipo=graphene.String(default_value='hamburguers'))

    grupos = graphene.List(GrupoType)

    produtos = graphene.List(ProdutoType)

    def resolve_grupos(self, info, **kwargs):
        return GrupoProduto.objects.filter(modelo=1)

    def resolve_favoritos(self, info, **kwargs):
        return Mostruario.objects.all()

    def resolve_produtos(self, info, **kwargs):
        return Produtos.objects.filter(p_bl=1)

    def resolve_bebidas(self, info, tipo, **kwargs):
        return Produtos.objects.filter(g_id=tipo, p_bl=1)

    def resolve_hamburguers(self, info, tipo, **kwargs):
        return Produtos.objects.filter(g_id=tipo, p_bl=1)


schema = graphene.Schema(query=Query)
