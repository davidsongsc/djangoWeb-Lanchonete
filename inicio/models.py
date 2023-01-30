# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Dados(models.Model):
    nomefiscal = models.CharField(max_length=45)
    nomesocial = models.CharField(max_length=60, blank=True, null=True)
    cnpj = models.CharField(max_length=14, blank=True, null=True)
    telefonea = models.CharField(max_length=11, blank=True, null=True)
    telefoneb = models.CharField(max_length=11, blank=True, null=True)
    telefonec = models.CharField(max_length=11, blank=True, null=True)
    cep = models.CharField(max_length=8, blank=True, null=True)
    rua = models.CharField(max_length=50, blank=True, null=True)
    numero = models.IntegerField(blank=True, null=True)
    bairro = models.CharField(max_length=50, blank=True, null=True)
    cidade = models.CharField(max_length=45, blank=True, null=True)
    estado = models.CharField(max_length=2, blank=True, null=True)
    fundacao = models.DateTimeField(blank=True, null=True)
    historia = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'dados'


class Dispensa(models.Model):
    produtoid = models.ForeignKey('Produtos', models.DO_NOTHING, db_column='produtoid')
    lote = models.CharField(max_length=12)
    quantidade = models.IntegerField(blank=True, null=True)
    validade = models.DateTimeField(blank=True, null=True)
    datahora = models.DateTimeField(db_column='dataHora', blank=True, null=True)  # Field name made lowercase.
    obs = models.TextField(blank=True, null=True)
    tipoestoque = models.IntegerField(db_column='tipoEstoque', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'dispensa'


class Logradouro(models.Model):
    usuario = models.IntegerField()
    cep = models.CharField(max_length=16, blank=True, null=True)
    rua = models.CharField(max_length=50, blank=True, null=True)
    numero = models.IntegerField(blank=True, null=True)
    bloco = models.CharField(max_length=5, blank=True, null=True)
    casa = models.CharField(max_length=5, blank=True, null=True)
    bairro = models.CharField(max_length=50, blank=True, null=True)
    cidade = models.CharField(max_length=45, blank=True, null=True)
    estado = models.CharField(max_length=2, blank=True, null=True)
    criadoem = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'logradouro'

class Mostruario(models.Model):
    reg = models.AutoField(primary_key=True)
    id = models.OneToOneField(Dispensa, models.DO_NOTHING, db_column='id')
    promocao = models.CharField(max_length=45, blank=True, null=True)
    nomefantasia = models.CharField(max_length=23, blank=True, null=True)
    descricao = models.TextField(blank=True, null=True)
    valor = models.FloatField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'mostruario'

        
class Notafiscal(models.Model):
    idfiscal = models.IntegerField(blank=True, null=True)
    conferencia = models.IntegerField(blank=True, null=True)
    tributos = models.FloatField(blank=True, null=True)
    encargos = models.FloatField(blank=True, null=True)
    descontos = models.FloatField(blank=True, null=True)
    identificador = models.CharField(max_length=16, blank=True, null=True)
    identificapj = models.CharField(max_length=14, blank=True, null=True)
    datahora = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'notafiscal'


class PedidoCarrinho(models.Model):
    carrinho = models.IntegerField()
    produtoid = models.IntegerField(blank=True, null=True)
    qtd = models.IntegerField(blank=True, null=True)
    observacao = models.CharField(max_length=18, blank=True, null=True)
    status = models.IntegerField(blank=True, null=True)
    datahora = models.DateTimeField(db_column='dataHora', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pedido_carrinho'
        unique_together = (('id', 'carrinho'),)


class PedidoComanda(models.Model):
    pedidoid = models.IntegerField(primary_key=True)
    carrinhoid = models.IntegerField(blank=True, null=True)
    clienteid = models.IntegerField(blank=True, null=True)
    vendedorid = models.IntegerField(db_column='vendedorID', blank=True, null=True)  # Field name made lowercase.
    datahora = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pedido_comanda'


class PedidoConferencia(models.Model):
    id = models.IntegerField(primary_key=True)
    comanda = models.IntegerField()
    totalbruto = models.FloatField(blank=True, null=True)
    totaldesconto = models.FloatField(blank=True, null=True)
    totalapagar = models.FloatField(blank=True, null=True)
    totaltaxa = models.FloatField(db_column='totalTaxa', blank=True, null=True)  # Field name made lowercase.
    bandeira = models.CharField(max_length=12, blank=True, null=True)
    valorrecebido = models.FloatField(blank=True, null=True)
    clienteid = models.IntegerField(blank=True, null=True)
    funcionarioid = models.IntegerField(blank=True, null=True)
    status = models.FloatField(blank=True, null=True)
    datahora = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pedido_conferencia'


class Pessoa(models.Model):
    id = models.IntegerField(primary_key=True)
    nome = models.CharField(max_length=45)
    fisica = models.CharField(max_length=16, blank=True, null=True)
    telefone = models.CharField(max_length=16, blank=True, null=True)
    celular = models.CharField(max_length=16, blank=True, null=True)
    email = models.CharField(max_length=55)
    aniversario = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'pessoa'


class Produtos(models.Model):
    id = models.IntegerField(primary_key=True)
    nomeproduto = models.CharField(unique=True, max_length=20)
    nomefantasia = models.CharField(unique=True, max_length=23)
    descricao = models.TextField()
    promo = models.CharField(max_length=12, blank=True, null=True)
    custo = models.FloatField(blank=True, null=True)
    valor = models.FloatField(blank=True, null=True)
    imposto = models.DecimalField(max_digits=2, decimal_places=0, blank=True, null=True)
    taxa = models.FloatField(blank=True, null=True)
    g_id = models.CharField(max_length=12)
    p_bl = models.IntegerField(blank=True, null=True)
    #img = models.CharField(max_length=23, blank=True, null=True)
    class Meta:
        managed = False
        db_table = 'produtos'


class Rota(models.Model):
    rotaid = models.IntegerField(blank=True, null=True)
    notafiscalid = models.IntegerField(blank=True, null=True)
    entregadorid = models.IntegerField(blank=True, null=True)
    taxa = models.FloatField(blank=True, null=True)
    clientelocal = models.IntegerField(blank=True, null=True)
    datahora = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'rota'


class Usuario(models.Model):
    codigo = models.AutoField(primary_key=True)
    login = models.CharField(unique=True, max_length=23)
    senha = models.CharField(max_length=16)
    perfil = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'usuario'
