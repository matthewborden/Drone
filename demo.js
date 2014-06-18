arDrone = require('ar-drone');
client  = arDrone.createClient();

client.config('general:navdata_demo', 'TRUE');

client.takeoff();

client
  .after(2000, function() {
    this.clockwise(0.7);
  })
  .after(9000, function() {
    this.stop();
    this.land();
  });
  
client.on('navdata', function processNavdata(navData) {
 	if (navData.demo.altitudeMeters) {
		if (navData.demo.altitudeMeters < 1) client.up(0.5);
		if (navData.demo.altitudeMeters > 1) client.down(0.5);
		console.log(navData.demo.altitudeMeters, " ", navData.demo.batteryPercentage);
	}
});
