//make this, and all controller specific javascript for that matter, load only on the tasks controller
	$(document).ready(function(){
		var clock = document.getElementById('clock');
		clockvalue = clock.value;
		clock.value= '';
		clock.style.background = '#ddd';
		// sets a variable if timer saved
		document.getElementById('update').onclick = function(){
    	window.btn_clicked = true;
			};

		// tests if timer is running
		function hasData() {
			var someThing = document.getElementById("clock");
			
			if (someThing.value != "") {
				return true;
			}		
			
			return false;
		}

		// tests if timer was started and if leaving without submitting
		window.onbeforeunload = function(){
		    	if(!window.btn_clicked && hasData()) {
		        	return "You have unsaved time tracked on this task. Don't forget to save!";
		    	}
			};
		});

	var flagclock = 0; 
	var flagstop = 0;
	var stoptime = 0;
	var updatebutton;

	function startstop()
		{
		var startstop = document.getElementById('startstopbutton');

		var updatebutton = document.getElementById('update')
		if(flagclock==0)
			{
			startstop.value = 'Stop Timer';
			flagclock = 1;
			startTimer();
			updatebutton.disabled = true;
			updatebutton.style.background = "grey";
			updatebutton.style.visibility = "visible";
			updatebutton.value = "Currently Timing...";
			clock.style.background = 'white';
			}
		else
			{
			startstop.value = 'Continue Timer';
			flagclock = 0;
			flagstop = 1;
			pauseTimer();
			updatebutton.disabled = false;
			updatebutton.style.background = "indianred";
			updatebutton.value ="Update Task Time";
			}
		}

//new timer code

function buildTime(t) {

    minutes = t.getMinutes();
    seconds = t.getSeconds();
    hours = t.getHours();
    if (minutes < 10) {
        minutes = "0"+minutes;
    }
    if (seconds < 10) {
        seconds = "0"+seconds;
    }
        return hours+":"+minutes;
}

// Call this to start the timer
function startTimer() {

    // If time isn't an object, create new Date and set seconds/minutes to 0
    if (typeof(time) != "object") {
        time = new Date();
        timearray = clockvalue.split(".");
        salt = "." + timearray[1];
        minmin = (parseFloat(salt) * 0.6) * 100;
		minstring = minmin.toString();
		minarray = minstring.split(".");
        if(timearray[0] > 0 ){
        	time.setHours(timearray[0]);
        }
        else {
        	time.setHours(0);
        }
        time.setSeconds(0); // Sets seconds to 0
        time.setMinutes(minarray[0]); // Sets minutes to 0
        clock.value = buildTime(time); // buildTime(time) returns 00:00
    }
    // Update seconds, to be executed every second or 1000 miliseconds
    function changeTimer() {
        time.setSeconds(time.getSeconds()+1);
        clock.value = buildTime(time);
    }
    // Set Interval to every second
    interval = setInterval(changeTimer, 1000);
}

// Pauses timer, seconds/minute count will be the same when started again
function pauseTimer() {
    clearInterval(interval);
}
