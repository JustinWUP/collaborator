  $(document).ready(function(){
      
    taskView($("#active"), '/task_feeds/active');


  $("#today").click(function(){

  taskView($("#today"), '/task_feeds/today');

  });

  $("#week").click(function(){

  taskView($("#week"), '/task_feeds/week');

  });


$("#active").click(function(){

  taskView($("#active"), '/task_feeds/active');
      });

      // buttonToggle($("#button"));
});


function taskView(element, url){

  $("#taskview").html('<img src="/assets/ajax-loader.gif">');
  
  $(".buttonstyle").each(function(){
    if($(this).hasClass("active")){
      $(this).toggleClass("active");
    }
  });

  $(element).addClass("active");
  $(".buttonstyle").each(function(){
    if($(this).hasClass("active")){
      $(this).attr("disabled","disabled");
    }
    else {
      $(this).removeAttr("disabled", "disabled");
    }
  });

  $.ajax({
      url: url,
      cache: true,
      success: function(html){
        $("#taskview").html(html);

      }
  });
}
