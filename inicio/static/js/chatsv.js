// Conectar ao websocket
var socket = new WebSocket('ws://' + window.location.host + '/ws/chat/');

// Receive messages from server
socket.onmessage = function(event) {
    var message = JSON.parse(event.data);
    console.log('Msg Recebida: ', message);
};

// Send messages to server
function sendMessage(message) {
    socket.send(JSON.stringify({
        'message': message
    }));
};

// Handle submit event on form
document.querySelector('form').addEventListener('submit', function(event) {
    event.preventDefault();

    // Get message from input field
    var message = document.querySelector('input[name="message"]').value;

    // Send message to server
    sendMessage(message);

    // Clear input field
    document.querySelector('input[name="message"]').value = '';
});
