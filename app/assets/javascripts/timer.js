	$(document).ready(function(){
		$('#update').hide();
		$('#changetagbox').hide();
		$("#clock").val('');
		$("#clock").css('background', '#ddd');
		// sets a variable if timer saved
		document.getElementById('update').onclick = function(){
    	window.btn_clicked = true;
			};

		// tests if timer was started and if leaving without submitting
		window.onbeforeunload = function(){
		    	if(!window.btn_clicked && seconds) {
		        	return "You have unsaved time tracked on this task. Don't forget to save!";
		    	}

		    	if(window.btn_clicked && ($("#changetag").val()=="")) {
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
		if(flagclock==0)
			{
			$("#startstopbutton").val('Stop Timer');
			flagclock = 1;
			startTimer();
			
			$("#update").attr('disabled', true);
			$('#update').show();
			$('#update').val("Currently Timing...");
			$('#clock').css('background', 'white');

			}
		else
			{
			$('#startstopbutton').val('Continue Timer');
			flagclock = 0;
			flagstop = 1;
			pauseTimer();
			if(clock.value != "0:00")  {
				$("#update").attr('disabled', false);
				$('#update').addClass("adminactions");
				$('#update').val("Update Task Time");
				$('#timesend').val(decimalTime());
				$('#changetagbox').show();
				}
			else{
				$('#update').val("No Time Logged.");
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
	
	clockvalue = $("#clock").val();
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
        $('#clock').val(buildTime(time)); // buildTime(time) returns 00:00
    }
    // Update seconds, to be executed every second or 1000 miliseconds
    function changeTimer() {
        time.setSeconds(time.getSeconds()+1);
        $('#clock').val(buildTime(time));
    }
    // Set Interval to every second
    interval = setInterval(changeTimer, 1000);
}

// Pauses timer, seconds/minute count will be the same when started again
function pauseTimer() {
    clearInterval(interval);
}
