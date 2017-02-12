var five = require('johnny-five');
var IO = require('raspi-io');

var board = new five.Board({
    io: new IO(),
    repl: false
});

board.on('ready', function() {
    var led = new five.Led({ pin: 1 });
    led.on();
});