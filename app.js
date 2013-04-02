// module decloration
arDrone = require('ar-drone');
client = arDrone.createClient();
pngStream = client.createPngStream({ log: process.stderr });
fs = require('fs');
navDataInt = require("./node_modules/navDataInt/app.js");
readline = require('readline');
jsfeat = require('jsfeat');
ffmpeg = require('ffmpeg');

var rl = readline.createInterface({
	input: process.stdin,
	output: process.stdout
});

//client.takeoff();
client.on('navdata', navDataInt.processNavdata);

pngStream.on('data', navDataInt.getImageData);
png.on('error', function(err) {
	console.error('png stream ERROR: ' + err);
});

client.config('general:navdata_demo', navDataInt.DemoState);
client.config('control:altitude_max', navDataInt.altitudeMax);

console.log("Flight Started:" + new Date());

startFlightTime = new Date();


//rl.question("Please Enter Landing Code >> ", navDataInt.landingCode);