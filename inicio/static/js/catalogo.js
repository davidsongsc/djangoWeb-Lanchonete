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
            section.id = lista[i].grupoNome;
            h1.innerHTML = lista[i].grupoNome;
            h1.className = 'titulo-grupo-produtos';
            h1.style.backgroundImage = 'url("static/img/itens/fundo.webp")'
            section.appendChild(h1);
            document.getElementById("catalogo").appendChild(section);
        }
    })
    .catch(error => {
        console.log(error);

    });
