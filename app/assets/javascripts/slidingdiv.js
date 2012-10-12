
    $(document).ready(function(){
 
        $(".slidingDiv_working").show();
        $(".show_hide_working").show();
 
    $('.show_hide_working').click(function(){
    $(".slidingDiv_working").slideToggle();
    });
 
   $(".slidingDiv_awaiting").show();
        $(".show_hide_awaiting").show();
 
    $('.show_hide_awaiting').click(function(){
    $(".slidingDiv_awaiting").slideToggle();
    });

      $(".slidingDiv_complete").hide();
        $(".show_hide_complete").show();
 
    $('.show_hide_complete').click(function(){
    $(".slidingDiv_complete").slideToggle();
    });


          $(".slidingDiv_topicreport").hide();
        $(".show_hide_topicreport").show();
 
    $('.show_hide_topicreport').click(function(){
    $(".slidingDiv_topicreport").slideToggle();
    });

          $(".slidingDiv_wikichanges").hide();
        $(".show_hide_wikichanges").show();
 
    $('.show_hide_wikichanges').click(function(){
    $(".slidingDiv_wikichanges").slideToggle();
    });
});

