const catalogoPreferidos = [];
fetch('http://localhost:8000/graphql?query={produtos{id, nomefantasia, descricao, valor}}')
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
                "imagem": lista[i].nomefantasia,
                "descricao": lista[i].descricao,
                "valor": lista[i].nomefantasia,
            }
            catalogoPreferidos.push(dados)
        }
        console.log(catalogoPreferidos[0].nome);
        for (var i = 0; i < catalogoPreferidos.length; i++) {
            var produto = catalogoPreferidos[i].nome;
            var section = document.createElement("section");
            var h2 = document.createElement("h2");
            var img = document.createElement("img");
            var pValor = document.createElement("p");
            var pDescricao = document.createElement("p");
            section.className = "categoria-produtos"
            section.id = "produto" + i;
            h2.textContent = catalogoPreferidos[i].nome;;
            img.src = "static/img/"+catalogoPreferidos[i].nome+".png"
            pValor.className = "valor-s";
            pDescricao.className = "desc-s";

            pValor.textContent = catalogoPreferidos[i].valor;;
            pDescricao.textContent = "Descrição: " + catalogoPreferidos[i].descricao;;
            section.appendChild(img);
            section.appendChild(h2);
            section.appendChild(pValor);
            section.appendChild(pDescricao);
            
            document.getElementById("catalogo").appendChild(section);
        }

    })
    .catch(error => {
        console.log(error);
    });
document.getElementById("catalogo").style.overflowX = "scroll";

//console.log(catalogoPreferidos.values)

// Carrega os 3 produtos melhor classificados

