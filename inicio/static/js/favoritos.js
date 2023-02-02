fetch('/graphql?query={favoritos{reg, nomefantasia, descricao, valor}}')
    .then(response => {
        if (response.ok) {
            return response.json();
        }
        throw new Error('Erro ao obter dados');
    })
    .then(data => {
        const cardapio = data.data.favoritos;
        console.log(cardapio.length);
        for (let i = 0; i < cardapio.length; i++) {
            // Cria o elemento Section.
            var section = document.createElement("section");

            section.id = 'favoritos';
 
            // Cria o elemento h1.
            var h1 = document.createElement("h1");
           
            // Adiciona a classe no h1, cl-[nomefantasia]
            h1.className = 'cl-' + cardapio[i].nomefantasia;

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
            img.src = "static/img/mostruario/" + cardapio[i].reg + ".png";
       
            // Adiciona h1 dentro da div.
            div.appendChild(h1);

            // Adiciona p dentro do h2.
            p.appendChild(h2);

            // Adiciona img dentro da div.
            div.appendChild(img);

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
            document.getElementById("catalogo").appendChild(section);

        }
        

    })
    .catch(error => {
        console.log(error);
    });
document.getElementById("catalogo").style.overflowX = "scroll";

//console.log(catalogoPreferidos.values)

// Carrega os 3 produtos melhor classificados

