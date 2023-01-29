var login = document.getElementById("area-login");
var iconeLogin = document.getElementById("ll-login");
var body = document.getElementById("materia");
var menuflutuante = document.createElement("div");
var menuLink = document.createElement("a");
var btnFechar =  document.createElement("a");
var menuIcone = document.createElement("img");
var menuLogado = document.createElement("div");
var entryUsuario = document.getElementById("username");
var entrySenha = document.getElementById("password");
var entryBotao = document.getElementById("botaoe");
var entryLinkc = document.getElementById("linkc");


var padrao = 1;
var testeUsuario = 0;

menuflutuante.className = "menu-do-usuario";

btnFechar.className = "botao-fechar";
btnFechar.innerText = "X";
menuLogado.appendChild(btnFechar);

menuLink.href = "javascript:menu()";
menuLink.id = "botao-menu";

menuIcone.src = "img/menu.png";
menuIcone.alt = "Menu Usuario";

menuLogado.className = "painel-usuario";
menuLogado.id = "carrinho";
menuLogado.style.backgroundColor = "#FFA500";
menuLogado.style.borderRadius = "6px";
menuLogado.style.padding = "300px 300px"
menuLogado.style.position = "fixed";
menuLogado.style.zIndex = "9";
menuLogado.style.bottom = "140px";
menuLogado.style.right = "9px";
menuLink.appendChild(menuIcone);


function loginMostrar(){
    if (padrao===0){
        login.style.opacity = 1;
        login.style.margin = "15px 0";
        login.style.transition = ".6s";

        iconeLogin.style.backgroundColor = "white";
        iconeLogin.style.borderRadius = "10px";
        iconeLogin.style.padding = "5px";
        iconeLogin.style.transition = "0.6s";
        iconeLogin.style.color = "black";

        entryUsuario.disabled = false;
        entrySenha.disabled = false;
        entryBotao.disabled = false;
        entryLinkc.innerText = "Aqui!";
        padrao = 1;

    } else {
        login.style.opacity = 0;
        login.style.margin = "-0px 0";
        login.style.transition = ".3s";

        iconeLogin.style.backgroundColor = "black";
        iconeLogin.style.color = "white";
        iconeLogin.style.transition = "0.9s";
        iconeLogin.style.padding = "5px";
 
        entryUsuario.disabled = true;
        entrySenha.disabled = true;
        entryBotao.disabled = true;
        entryLinkc.innerText = "";
        padrao = 0;
    }
   
}
var verificaMenu = 0;

function menu(){
   
    if (verificaMenu===0){
        menuflutuante.appendChild(menuLogado);
        verificaMenu = 1;
    } else {
        menuflutuante.removeChild(menuLogado);
        verificaMenu = 0;
    }
}

menuflutuante.appendChild(menuLink);
function logar(){
    if (testeUsuario===0) {
        //login.remove();
        loginMostrar();
        iconeLogin.innerText = "Sair";
        iconeLogin.href = "/";
        body.appendChild(menuflutuante);
    }
}



