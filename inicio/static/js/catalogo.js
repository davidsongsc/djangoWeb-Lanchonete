const catalogoPreferidos = [];
fetch('/graphql?query={grupos{grupoNome}}')
    .then(response => {
        if (response.ok) {
            return response.json();
        }
        throw new Error('Erro ao obter dados');
    })
    .then(data => {
        const lista = data.data.grupos;
        for (let i = 0; i < lista.length; i++) {
            var section = document.createElement("section");
            var h1 = document.createElement("h1");
            var div = document.createElement("div");
            console.log(lista[i]);
            h1.className = 'titulo-grupo-produtos';
            h1.style.backgroundImage = 'url("static/img/itens/fundo.webp")'
            h1.style
            h1.innerHTML = lista[i].grupoNome;
            div.className = lista[i];
            div.id = 'catalogo';
            
            section.appendChild(h1);
            section.appendChild(div);
            
            
            document.getElementById("catalogo").appendChild(section);
            
        }


    })
    .catch(error => {
        console.log(error);
    });
document.getElementById("catalogo").style.overflowX = "scroll";

//console.log(catalogoPreferidos.values)

// Carrega os 3 produtos melhor classificados

