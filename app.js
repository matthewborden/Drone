var arDrone = require('ar-drone'),
client 		= arDrone.createClient(),
cv 			= require('opencv'),
//pngStream 	= client.createPngStream(),
fs 			= require('fs');

/* Create a command line instance of the repl */
client.createRepl();
getStartup();

/* Startup Processing */

function getStartup() {
		/* Create a new image stream */
		//pngStream.on('error', console.log).on('data', getImageData);
	client.takeoff();
	client.down(0.1);
	client.stop();
	client.on('navdata', logToFile);
		
	client
		  .after(5000, function() {
		    this.clockwise(0.5);
		  })
		  .after(3000, function() {
		    this.stop();
		    this.land();
		  });
}

/* Camera & Image Processing */

function makeRequest(pngBuffer) {
	//send the image and each face in the db to lambada if match then backoff() else attack();
}

function getImageData (pngBuffer) {
	cv.readImage(pngBuffer, function(err, im){
		im.detectObject("./haarcascade_frontalface_alt.xml", {}, function(err, faces){
	        for (var i=0;i<faces.length; i++){
	          var x = faces[i]
	          im.ellipse(x.x + x.width/2, x.y + x.height/2, x.width/2, x.height/2);
	        }
	        im.save('./out.jpg');
	    });
	});
}

/* Logging */

function logToFile (input) {
	fs.appendFile(__dirname + '/log.txt', input + '\n', function (err) {
		if (err) return console.log(err);
	});
}

/* Sine Wave */

function setCountersToValue(increase){
	// circulate the y,x var, adding
	y = y + 1;
	x = x + increase;
}

function setCountersZero(){
	x = 0; 
	y = 0; 
	z = [];
}
 
function createSineWave (increase) {
	increase = (increase / 360) * (2 * Math.PI)
	// Create values of the wave
	z[y] = (Math.sin(x)/2) + 0.5;
	currentValue = z[y];
	
	nextXValue = x + increase;
	nextValue = (Math.sin(nextXValue)/2) + 0.5;
	
	//use values to rise/fall the drone
	if (nextValue > z[y]) {
		setCountersToValue(increase);
		return client.up(nextValue - currentValue); 
	} // do the subtraction values
	if (nextValue < z[y]) {
		setCountersToValue(increase);
		return client.down(currentValue - nextValue);
	}; // do the subtraction values
}

/* Navdata */

function processNavdata(navData) {
	console.log( navData );
	
}