  $(document).ready(function(){
    function buttonToggle(element, element2){
    if($(element).attr("disabled") == "disabled"){
      $(element).removeAttr("disabled", "disabled");
      $(element2).attr("disabled", "disabled");
    }
    else{
      $(element).attr("disabled","disabled");
      $(element2).removeAttr("disabled", "disabled");
    }
  }
    
  $("#today").click(function(){

    $("#taskview").html('<img src="/assets/ajax-loader.gif">');
          $("#today").css("background", 'green');
          buttonToggle($("#today"),$("#week"));

        $("#week").css("background", 'indianred');
  $.ajax({
      url: "/today",
      cache: false,
      success: function(html){
        $("#taskview").html(html);

      }
  });
  });

  $("#week").click(function(){

    $("#taskview").html('<img src="/assets/ajax-loader.gif">');
                $("#today").css("background", 'indianred');
               buttonToggle($("#week"),$("#today"));
        $("#week").css("background", 'green');
    $.ajax({
      url: "/week",
      cache: false,
      success: function(html){
        $("#taskview").html(html);

      }
  });
  });
});

// function taskView(element, element2, url){


//   $("#taskview").html('<%= escape_javascript(image_tag("ajax-loader.gif"))%>');
//         element.css("background", 'green');
//         buttonToggle(element,element2);

//       element2.css("background", 'indianred');
// $.ajax({
//     url: url,
//     cache: true,
//     success: function(html){
//       $("#taskview").html(html);

//     }
// });

// }
