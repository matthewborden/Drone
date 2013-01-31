var getDrone = require('./controlDrone.js');

// A simple system to check that sineWave() Works
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
		return getDrone.setCommand("yAxis", 'rise', (nextValue - currentValue)); 
	} // do the subtraction values
	if (nextValue < z[y]) {
		setCountersToValue(increase);
		return getDrone.setCommand("yAxis", 'fall', (currentValue - nextValue));
	}; // do the subtraction values
}


module.exports = {
	setCountersZero:setCountersZero,
	setSineWaveValue:setSineWaveValue,
}