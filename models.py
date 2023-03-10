# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AccountEmailaddress(models.Model):
    email = models.CharField(unique=True, max_length=254)
    verified = models.IntegerField()
    primary = models.IntegerField()
    user = models.ForeignKey('AuthUser', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'account_emailaddress'


class AccountEmailconfirmation(models.Model):
    created = models.DateTimeField()
    sent = models.DateTimeField(blank=True, null=True)
    key = models.CharField(unique=True, max_length=64)
    email_address = models.ForeignKey(AccountEmailaddress, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'account_emailconfirmation'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()
    pessoafisica = models.CharField(max_length=16, blank=True, null=True)
    aniversario = models.DateTimeField(blank=True, null=True)
    telefone1 = models.CharField(max_length=16, blank=True, null=True)
    telefone2 = models.CharField(max_length=16, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


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


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class GrupoProduto(models.Model):
    id = models.IntegerField(primary_key=True)
    grupo_nome = models.CharField(unique=True, max_length=12)
    grupo_identifica = models.CharField(max_length=45)
    modelo = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'grupo_produto'


class Logradouro(models.Model):
    usuario = models.ForeignKey(AuthUser, models.DO_NOTHING, db_column='usuario')
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


class PedidoComanda(models.Model):
    pedidoid = models.IntegerField(primary_key=True)
    carrinhoid = models.ForeignKey(PedidoCarrinho, models.DO_NOTHING, db_column='carrinhoid', to_field='carrinho', blank=True, null=True)
    clienteid = models.ForeignKey(AuthUser, models.DO_NOTHING, db_column='clienteid', blank=True, null=True)
    vendedorid = models.ForeignKey(AuthUser, models.DO_NOTHING, db_column='vendedorID', blank=True, null=True)  # Field name made lowercase.
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
    g = models.ForeignKey(GrupoProduto, models.DO_NOTHING, to_field='grupo_nome', blank=True, null=True)
    p_bl = models.IntegerField(blank=True, null=True)

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


class SocialaccountSocialaccount(models.Model):
    provider = models.CharField(max_length=30)
    uid = models.CharField(max_length=191)
    last_login = models.DateTimeField()
    date_joined = models.DateTimeField()
    extra_data = models.TextField()
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'socialaccount_socialaccount'
        unique_together = (('provider', 'uid'),)


class SocialaccountSocialapp(models.Model):
    provider = models.CharField(max_length=30)
    name = models.CharField(max_length=40)
    client_id = models.CharField(max_length=191)
    secret = models.CharField(max_length=191)
    key = models.CharField(max_length=191)

    class Meta:
        managed = False
        db_table = 'socialaccount_socialapp'


class SocialaccountSocialtoken(models.Model):
    token = models.TextField()
    token_secret = models.TextField()
    expires_at = models.DateTimeField(blank=True, null=True)
    account = models.ForeignKey(SocialaccountSocialaccount, models.DO_NOTHING)
    app = models.ForeignKey(SocialaccountSocialapp, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'socialaccount_socialtoken'
        unique_together = (('app', 'account'),)
