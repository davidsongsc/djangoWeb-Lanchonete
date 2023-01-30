const catalogoPreferidos = [];
fetch('/graphql?query={favoritos{reg, nomefantasia, descricao, valor}}')
    .then(response => {
        if (response.ok) {
            return response.json();
        }
        throw new Error('Erro ao obter dados');
    })
    .then(data => {
        const lista = data.data.favoritos;
        console.log(lista.length);
        for (let i = 0; i < lista.length; i++) {
            //        catalogoPreferidos.push(lista);
            dados = {
                "nome": lista[i].nomefantasia,
                "imagem": lista[i].reg,
                "descricao": lista[i].descricao,
                "valor": lista[i].valor,
            }
            catalogoPreferidos.push(dados)
            
        }
        console.log(catalogoPreferidos[0].nome);
        var section = document.createElement("section");
        for (var i = 0; i < catalogoPreferidos.length; i++) {
            var img = document.createElement("img");
            section.className = "categoria-especiais"
            section.id = "produto-favorito";
            img.className =  "exibi"+i;
            img.src = "static/img/produtos/"+catalogoPreferidos[i].imagem+".png"
            section.appendChild(img);
            document.getElementById("catalogo").appendChild(section);
        }

    })
    .catch(error => {
        console.log(error);
    });
document.getElementById("catalogo").style.overflowX = "scroll";

//console.log(catalogoPreferidos.values)

// Carrega os 3 produtos melhor classificados

