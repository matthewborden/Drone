process.argv.forEach(function (val, index, array) {
	if (index > 1){
		// the code.
		n = val;
		console.log( n * (n - 1) / 2);  
	}
});