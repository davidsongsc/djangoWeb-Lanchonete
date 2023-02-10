/* 
    No Exmplo no catalogo.js:
        temos
        <section id="ecl-hamburguers">
            ... (conteudo)
        </section>

    Este (conteudo) é este EX:
        <section id="ecl-chavaburg" class="interino-hamburguers">
        </section>
    
    Ou seja, após a criação dos grupos é criado a listagem de produtos.
    seguindo o mexmo exemplo do catalogo.js onde esta o exemplo do 'Banco de dados'
    mas desta vez a base de dados é 'produtos' a api repassa apenas o id, nomeproduto,
    nomefantasia, descricao e valor. 
    a variavel [cardapio] reformula lista anterior
*/

// API TESTE
fetch('/graphql?query={produtos{nomeproduto, nomefantasia, descricao, valor, gId}}')
    .then(response => {
        if (response.ok) {
            return response.json();
        }
        throw new Error('Erro ao obter dados');
    })
    .then(data => {
        const cardapio = data.data.produtos;
        // Loop dados para cardapio.
        for (let i = 0; i < cardapio.length; i++) {
            console.log(cardapio[i].gId);
            // Cria o elemento Section.
            var section = document.createElement("section");

            // Adiciona id ecl-[nome da imagem do produto] ex:
            // ecl-bebidas ou então cl-sobremesas.
            //
            section.id = 'ecl-' + cardapio[i].nomeproduto;
            section.className = 'interino-' + cardapio[i].gid;
            

            // Cria o elemento h1.
            var h1 = document.createElement("h1");
           
            // Cria o elemento a.
            var taga = document.createElement("a");

            // Adiciona a classe no h1, cl-[nomefantasia]
            h1.className = 'cl-' + cardapio[i].nomefantasia;
            
            // Adiciona a id no h1, [nomeproduto]
            h1.id = cardapio[i].nomeproduto;

            // Adiciona o texto [nomefantasia] no h1.
            h1.innerHTML = cardapio[i].nomefantasia;

            // Cria o elemento h2.
            var h2 = document.createElement("h2");

            // Adiciona texto "R$" + [valor] no h2.
            h2.innerHTML = "R$ " + cardapio[i].valor;

            // cria o elemento div.
            var div = document.createElement("div");

            // cria o elemento p.
            var p = document.createElement("p");

            // Adiciona texto [descricao] no p.
            p.innerHTML = cardapio[i].descricao;

            // cria o elemento img.
            var img = document.createElement("img");

            //img.className = "exibi" + i;
            img.src = "static/img/produtos/" + cardapio[i].nomeproduto + ".png";
            // gera link para tag a.
            //taga.href = "#";
            taga.appendChild(h1);
            taga.appendChild(img);
            taga.appendChild(h2);
            div.appendChild(taga);


            // Adiciona img dentro da div.
            //div.appendChild(img);

            // Adiciona p dentro da div.
            div.appendChild(p);

            // Adiciona a div dentro da section
            section.appendChild(div);
            
            /*
                Aqui a Section criada para o produto é adicionada a Section
                correspondente com o tipo de produtos. Sendo assim, bebidas
                sempre vão ficar nas bebidas, hamburguers dentro da section 
                hamburguers, também sobremesas dentro da section sobremesas
            */

            // Adiciona Section dentro da Section do catalogo.js
            document.getElementById(cardapio[i].gId).appendChild(section);

        }

    })
    .catch(error => {
        console.log(error);
    });