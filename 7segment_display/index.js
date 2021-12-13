function update_time() {
	var h = moment().format("HH");
	var m = moment().format("mm");
	var s = moment().format("ss");
    
	document.getElementById("hour-1").setAttribute("class","num-"+h.substr(0,1));
	document.getElementById("hour-2").setAttribute("class","num-"+h.substr(1,1));
	document.getElementById("minute-1").setAttribute("class","num-"+m.substr(0,1));
	document.getElementById("minute-2").setAttribute("class","num-"+m.substr(1,1));
	document.getElementById("second-1").setAttribute("class","num-"+s.substr(0,1));
	document.getElementById("second-2").setAttribute("class","num-"+s.substr(1,1));

	setTimeout(update_time, 1000);
}

update_time();