function runTest() {    
    var oldTime = new Date();
    for (i = 0; i < 3; i = i + 0.1) {
        var height = i;
        var desiredHeight = 1.8;
        
        var cte = desiredHeight - height;
        var  time = new Date() - oldTime;
           //dist =  * time;
      
        var change = cte - cte_old;
        var cte_sum = cte_sum + cte;
        var cte_old = cte;
      
        newSpeed = (0.75 * cte); // - (1 * change / time) - (1 * cte_sum)
        if (newSpeed >= 0) { console.log(newSpeed, height)} else {console.log(-newSpeed,height)}
        
        document.getElementById("result").innerHTML = document.getElementById("result").innerHTML + "Height: " + height + " Speed: " + newSpeed + "</br>"; 
        oldTime = new Date();
    }
}