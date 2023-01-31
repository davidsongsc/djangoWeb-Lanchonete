const cardapio = [];

fetch('/graphql?query={produtos{nomeproduto, nomefantasia, descricao, valor, gId}}')
    .then(response => {
        if (response.ok) {
            return response.json();
        }
        throw new Error('Erro ao obter dados');
    })
    .then(data => {
        const lista = data.data.produtos;
        for (let i = 0; i < lista.length; i++) {
            //        catalogoPreferidos.push(lista);
            dados = {
                "nome": lista[i].nomefantasia,
                "imagem": lista[i].nomeproduto,
                "descricao": lista[i].descricao,
                "valor": lista[i].valor,
                "grupo": lista[i].gId,
            }
            cardapio.push(dados)


        }
        for (var i = 0; i < cardapio.length; i++) {
            var section = document.createElement("section");
            var h1 = document.createElement("h1");
            var h2 = document.createElement("h2");
            var div = document.createElement("div");
            var p = document.createElement("p");
            var img = document.createElement("img");
            section.id = 'ecl-'+cardapio[i].imagem;
            section.className = 'interino-' + cardapio[i].grupo;
            h1.className = 'cl-' + cardapio[i].nome;
            h1.id = cardapio[i].imagem;
            h1.innerHTML = cardapio[i].nome;
            //img.className = "exibi" + i;
            img.src = "static/img/produtos/" + cardapio[i].imagem + ".png";
            p.innerHTML = cardapio[i].descricao;
            h2.innerHTML = "R$ "+ cardapio[i].valor;
            div.appendChild(h1);
            p.appendChild(h2);
            div.appendChild(img);
            div.appendChild(p);
            section.appendChild(div);
            
            document.getElementById(cardapio[i].grupo).appendChild(section);
        }

    })
    .catch(error => {
        console.log(error);
    });