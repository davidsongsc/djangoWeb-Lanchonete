# Generated by Django 4.1.5 on 2023-01-28 15:10

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Dados',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nomefiscal', models.CharField(max_length=45)),
                ('nomesocial', models.CharField(blank=True, max_length=60, null=True)),
                ('cnpj', models.CharField(blank=True, max_length=14, null=True)),
                ('telefonea', models.CharField(blank=True, max_length=11, null=True)),
                ('telefoneb', models.CharField(blank=True, max_length=11, null=True)),
                ('telefonec', models.CharField(blank=True, max_length=11, null=True)),
                ('cep', models.CharField(blank=True, max_length=8, null=True)),
                ('rua', models.CharField(blank=True, max_length=50, null=True)),
                ('numero', models.IntegerField(blank=True, null=True)),
                ('bairro', models.CharField(blank=True, max_length=50, null=True)),
                ('cidade', models.CharField(blank=True, max_length=45, null=True)),
                ('estado', models.CharField(blank=True, max_length=2, null=True)),
                ('fundacao', models.DateTimeField(blank=True, null=True)),
                ('historia', models.TextField(blank=True, null=True)),
            ],
            options={
                'db_table': 'dados',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Dispensa',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('produtoid', models.IntegerField()),
                ('lote', models.CharField(max_length=12)),
                ('quantidade', models.IntegerField(blank=True, null=True)),
                ('validade', models.DateTimeField(blank=True, null=True)),
                ('datahora', models.DateTimeField(blank=True, db_column='dataHora', null=True)),
                ('obs', models.TextField(blank=True, null=True)),
                ('tipoestoque', models.IntegerField(blank=True, db_column='tipoEstoque', null=True)),
            ],
            options={
                'db_table': 'dispensa',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Logradouro',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('usuario', models.IntegerField()),
                ('cep', models.CharField(blank=True, max_length=16, null=True)),
                ('rua', models.CharField(blank=True, max_length=50, null=True)),
                ('numero', models.IntegerField(blank=True, null=True)),
                ('bloco', models.CharField(blank=True, max_length=5, null=True)),
                ('casa', models.CharField(blank=True, max_length=5, null=True)),
                ('bairro', models.CharField(blank=True, max_length=50, null=True)),
                ('cidade', models.CharField(blank=True, max_length=45, null=True)),
                ('estado', models.CharField(blank=True, max_length=2, null=True)),
                ('criadoem', models.DateTimeField(blank=True, null=True)),
            ],
            options={
                'db_table': 'logradouro',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Notafiscal',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('idfiscal', models.IntegerField(blank=True, null=True)),
                ('conferencia', models.IntegerField(blank=True, null=True)),
                ('tributos', models.FloatField(blank=True, null=True)),
                ('encargos', models.FloatField(blank=True, null=True)),
                ('descontos', models.FloatField(blank=True, null=True)),
                ('identificador', models.CharField(blank=True, max_length=16, null=True)),
                ('identificapj', models.CharField(blank=True, max_length=14, null=True)),
                ('datahora', models.DateTimeField(blank=True, null=True)),
            ],
            options={
                'db_table': 'notafiscal',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='PedidoCarrinho',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('carrinho', models.IntegerField()),
                ('produtoid', models.IntegerField(blank=True, null=True)),
                ('qtd', models.IntegerField(blank=True, null=True)),
                ('observacao', models.CharField(blank=True, max_length=18, null=True)),
                ('status', models.IntegerField(blank=True, null=True)),
                ('datahora', models.DateTimeField(blank=True, db_column='dataHora', null=True)),
            ],
            options={
                'db_table': 'pedido_carrinho',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='PedidoComanda',
            fields=[
                ('pedidoid', models.IntegerField(primary_key=True, serialize=False)),
                ('carrinhoid', models.IntegerField(blank=True, null=True)),
                ('clienteid', models.IntegerField(blank=True, null=True)),
                ('vendedorid', models.IntegerField(blank=True, db_column='vendedorID', null=True)),
                ('datahora', models.DateTimeField(blank=True, null=True)),
            ],
            options={
                'db_table': 'pedido_comanda',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='PedidoConferencia',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('comanda', models.IntegerField()),
                ('totalbruto', models.FloatField(blank=True, null=True)),
                ('totaldesconto', models.FloatField(blank=True, null=True)),
                ('totalapagar', models.FloatField(blank=True, null=True)),
                ('totaltaxa', models.FloatField(blank=True, db_column='totalTaxa', null=True)),
                ('bandeira', models.CharField(blank=True, max_length=12, null=True)),
                ('valorrecebido', models.FloatField(blank=True, null=True)),
                ('clienteid', models.IntegerField(blank=True, null=True)),
                ('funcionarioid', models.IntegerField(blank=True, null=True)),
                ('status', models.FloatField(blank=True, null=True)),
                ('datahora', models.DateTimeField(blank=True, null=True)),
            ],
            options={
                'db_table': 'pedido_conferencia',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Pessoa',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('nome', models.CharField(max_length=45)),
                ('fisica', models.CharField(blank=True, max_length=16, null=True)),
                ('telefone', models.CharField(blank=True, max_length=16, null=True)),
                ('celular', models.CharField(blank=True, max_length=16, null=True)),
                ('email', models.CharField(max_length=55)),
                ('aniversario', models.DateField(blank=True, null=True)),
            ],
            options={
                'db_table': 'pessoa',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Produtos',
            fields=[
                ('id', models.IntegerField(primary_key=True, serialize=False)),
                ('nomeproduto', models.CharField(max_length=20, unique=True)),
                ('nomefantasia', models.CharField(max_length=23, unique=True)),
                ('descricao', models.TextField()),
                ('promo', models.CharField(blank=True, max_length=12, null=True)),
                ('custo', models.FloatField(blank=True, null=True)),
                ('valor', models.FloatField(blank=True, null=True)),
                ('imposto', models.DecimalField(blank=True, decimal_places=0, max_digits=2, null=True)),
                ('taxa', models.FloatField(blank=True, null=True)),
                ('g_id', models.CharField(max_length=12)),
                ('p_bl', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'produtos',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Rota',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('rotaid', models.IntegerField(blank=True, null=True)),
                ('notafiscalid', models.IntegerField(blank=True, null=True)),
                ('entregadorid', models.IntegerField(blank=True, null=True)),
                ('taxa', models.FloatField(blank=True, null=True)),
                ('clientelocal', models.IntegerField(blank=True, null=True)),
                ('datahora', models.DateTimeField(blank=True, null=True)),
            ],
            options={
                'db_table': 'rota',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('codigo', models.AutoField(primary_key=True, serialize=False)),
                ('login', models.CharField(max_length=23, unique=True)),
                ('senha', models.CharField(max_length=16)),
                ('perfil', models.IntegerField()),
            ],
            options={
                'db_table': 'usuario',
                'managed': False,
            },
        ),
    ]
