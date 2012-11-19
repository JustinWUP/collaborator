	$(document).ready(function(){
		var clock = document.getElementById('clock');
		var instruct = document.getElementById('instruct');
		var timesend = document.getElementById('timesend');
		var changetag = document.getElementById('changetag');
		var changetagbox = document.getElementById('changetagbox');
		var nextsteps = document.getElementById('next-steps');
		clock.value = '';
		nextsteps.style.height = "190px";
		clock.style.background = '#ddd';
		// sets a variable if timer saved
		document.getElementById('update').onclick = function(){
    	window.btn_clicked = true;
			};

		// tests if timer is running
		function hasData(element) {
			
			if (element != "") {
				return true;
			}		
			
			return false;
		}

		// tests if timer was started and if leaving without submitting
		window.onbeforeunload = function(){
		    	if(!window.btn_clicked && (hasData(clock.value) && (clock.value != '0:00'))) {
		        	return "You have unsaved time tracked on this task. Don't forget to save!";
		    	}

		    	if(window.btn_clicked && !hasData(changetag.value)) {
		    		return "Please enter a note about what you did on this task."
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
		var nextsteps = document.getElementById('next-steps');
		var updatebutton = document.getElementById('update');
		if(flagclock==0)
			{
			startstop.value = 'Stop Timer';
			instruct.innerHTML = "Click 'Stop Timer' when finished.";
			flagclock = 1;
			startTimer();
			
			updatebutton.disabled = true;
			updatebutton.style.background = "grey";
			updatebutton.style.visibility = "visible";
			updatebutton.value = "Currently Timing...";
			clock.style.background = 'white';
			if(clock.value == "0:00"){	
				nextsteps.style.height = "220px";
				}
			else {
				nextsteps.style.height = "300px";
				}
			}
		else
			{
			startstop.value = 'Continue Timer';
			instruct.innerHTML = "'Continue Timer' to keep working."
			flagclock = 0;
			flagstop = 1;
			pauseTimer();
			if(clock.value != "0:00")  {
				updatebutton.disabled = false;
				updatebutton.style.background = "indianred";
				updatebutton.value ="Update Task Time";
				nextsteps.style.height = "300px";
				nextsteps.style.top = "40px";
				updatebutton.style.top = "262px";
				timesend.value = decimalTime();
				changetagbox.style.visibility ="visible";
				instruct.innerHTML = "'Continue Timer' to keep working or 'Update Task Time' to save your time."
				}
			else{
				updatebutton.value = "No Time Logged."
				}
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

function decimalTime(){
	
	clockvalue = clock.value;
	timearray = clockvalue.split(":");
	minutes = timearray[1] / 60;
	hours = timearray[0] / 1;
	timeeng = hours + minutes;
	return timeeng;
}

// Call this to start the timer
function startTimer() {

    // If time isn't an object, create new Date and set seconds/minutes to 0
    if (typeof(time) != "object") {
        time = new Date();
        time.setHours(0);
        time.setSeconds(0); // Sets seconds to 0
        time.setMinutes(0);
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
