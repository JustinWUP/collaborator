$(document).ready(function(){
  var active = document.getElementById('task_active');
  var bill = document.getElementById('bill');
  var billable = document.getElementById('task_billable');
  var taskdecline = document.getElementById('taskdecline');
  window.onload = function() {
  	if(hasData(billable.checked && !active.checked)){
  	bill.style.visibility ="visible";
  }
  else {
  	bill.style.visibility = "hidden";
  }
  }

});

function showBill(){
	 billable = document.getElementById('task_billable');
	 active = document.getElementById('task_active');
if(hasData(billable.checked && !active.checked)){

  bill.style.visibility = "visible";
}
else {
	bill.style.visibility = "hidden";

}
}

function hasData(element) {
  
  if (element != "") {
    return true;
  }   
  
  return false;
}
