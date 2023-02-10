/*
    o nome da classe ou id é baseado no prefixo 
    ecl-. Exemplo:
        ecl-hamburguers
        ecl-bebidas
        ecl-sobremesas
    
    Estes nomes podem ser usados para criação de estilos.
    Note que o site sempre vai gerar Exemplos do conteudo
    da tabela 'grupo_produto' com valor inteiro '1' no 
    banco de dados. Caso seja cadastrado um novo item na 
    tabela com modelo == 1.

        EX:
            Banco de dados

        [id]      [grupo_nome]      [grupo_indentifica]       [modelo]
            1          hamburguers             0                     1
            2          sobremesas              0                     1
            3          bebidas                 0                     1
        
        EX:
            HTML index&=cardapio       

            <section id="ecl-hamburguers">
                ... (conteudo)

            </section>

            <section id="ecl-bebidas">

                ... (conteudo)

            </section>

            <section id="ecl-sobremesas">

                ... (conteudo)

            </section>
    */
   
// API TESTE
fetch('/graphql?query={grupos{grupoNome}}')
    .then(response => {
        if (response.ok) {
            return response.json();
        }
        throw new Error('Erro ao obter dados');
    })
    .then(data => {
        const lista = data.data.grupos;

        // Loop de elaboração dos grupos de produtos.
        for (let i = 0; i < lista.length; i++) {
            var link = document.createElement("a");
            link.href = "#" + lista[i].grupoNome;
            var li = document.createElement("li");
            li.innerText = lista[i].grupoNome;
            link.appendChild(li);

            conteudo = document.querySelector(".lista-planos");
            conteudo.appendChild(link);
            // Cria o elemento section que abriga o nome dos grupos dos produtos.
            var section = document.createElement("section");

            // Adiciona o grupo_nome a id da section.
            section.id = lista[i].grupoNome;

            // Cria o elemento h1.
            var h1 = document.createElement("h1");

            //  Adiciona o Texto [grupo_nome] no h1.
            h1.innerHTML = lista[i].grupoNome;

            //  Adiciona class titulo-grupo-produtos no h1.
            h1.className = 'titulo-grupo-produtos';

            //  Adiciona a imagem fundo.webp ao background do h1.
            h1.style.backgroundImage = 'url("static/img/itens/plateleira.png")'

            // Adiciona o conteudo do h1 a section.
            section.appendChild(h1);

            // Adiciona a Section dentro da div catalogo.
            document.getElementById("catalogo").appendChild(section);
        }
    })
    .catch(error => {
        console.log(error);

    });
