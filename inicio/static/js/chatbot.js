
var socket = new WebSocket("ws://" + window.location.host + "/ws/chat/");
console.log("Server IP Local"+window.location.host);
socket.onclose = function(event) {
    console.error('WebSocket closed with code', event.code, 'reason', event.reason);

    setTimeout(function() {
        console.log('Trying to reconnect...');
        socket = new WebSocket("ws://" + window.location.host + "/ws/chat/");
    }, 5000);
};
socket.onmessage = function (e) {
    var data = JSON.parse(e.data);
    var message = data['message'];
    console.log("Message received: " + message);
};

socket.onclose = function (e) {
    console.error("Socket closed unexpectedly");
};

document.getElementById("send-button").onclick = function () {
    var input = document.getElementById("chat-input");
    var message = input.value;
    input.value = "";
    socket.send(JSON.stringify({
        'message': message
    }));
};


// ENVIAR MENSAGEM.
// ENVIAR MENSAGEM.
function mensagemEnviada() {
    const messageContainer = document.createElement("div");
    const msg = document.querySelector("#chat-input").value;

    if (!msg) {
        alert("Por favor, digite um texto.")
    } else {
        messageContainer.classList.add("message-container", "sent");

        const message = document.createElement("div");
        message.classList.add("message");
        message.innerText = msg;

        const messageStatus = document.createElement("div");
        messageStatus.classList.add("message-status");
        messageStatus.innerText = "Enviada";

        messageContainer.appendChild(message);
        messageContainer.appendChild(messageStatus);

        const conversationContainer = document.querySelector(".conversation-container");
        conversationContainer.appendChild(messageContainer);
        msg.value = "";

        // FIXA SCROLL NA ULTIMA MENSAGEM
        const contextContainer = document.querySelector('#context-container');

        function scrollToBottom() {
            contextContainer.scrollTop = contextContainer.scrollHeight;
        }

        // chamar a função após adicionar uma nova mensagem ao elemento #context-container
        scrollToBottom();
    }
}
