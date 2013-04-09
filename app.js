// module decloration
arDrone = require('ar-drone');
client  = arDrone.createClient();

// Navigation and Video Stream
TCPStream  = new arDrone.Client.PngStream.TcpVideoStream();
navDataInt = require("./node_modules/navDataInt/app.js");
Parser = require("./node_modules/ar-drone/lib/video/PaVEParser.js");

// Other Modules
fs       = require('fs');
readline = require('readline');
jsfeat   = require('jsfeat');
ffmpeg   = require('ffmpeg');
colors   = require('colors');
opencv   = require('opencv');
image    = require('image');

VideoStream = new Parser();

var rl = readline.createInterface({
	input  : process.stdin,
	output : process.stdout
});

if (process.argv[2] == "fly") client.takeoff();
client.on('navdata', navDataInt.processNavdata);

TCPStream.connect(function () {
    TCPStream.pipe(VideoStream);
    console.log("Video Stream Active".green);
});

VideoStream.on('data', function (buffer) {    
    (new Image('png')).encode(buffer, buffer.display_width, buffer.display_height,
        function (data, error) {
            fs.writeFile('message.png', data, function (err) {
              if (err) throw err;
              console.log('It\'s saved!');
            });
        }
    );
});//navDataInt.getImageData);

TCPStream.on('error', function(err) {
    console.error(('ERROR:' + err).red);
});

client.config('general:navdata_demo', navDataInt.DemoState);
client.config('control:altitude_max', navDataInt.altitudeMax);

console.log("Flight Started:" + new Date());

startFlightTime = new Date();


// rl.question("Press Enter to land the drone and save your life >>", navDataInt.landingCode);
