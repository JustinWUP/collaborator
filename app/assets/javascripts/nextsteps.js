   		$( document ).ready( function (){
				$( '#next-steps' ).scrollFollow({
					speed: 200,
					delay: 20,
   					offset: 60,
				});
			});

$(function(){
	var slide = 0;
$("#shower").click(function(){
	
	if(slide == 0) {
    $("#next-steps").animate({marginLeft:'-187px'}, 'slow');   
    $("#content").animate({marginLeft:'40px', width:'90%', paddingRight:'150px'}, 'slow');   
    $("#content-wrap").animate({paddingLeft:'80px', width:'100%'}, 'slow');  


    $("#button").attr('class',"icon-chevron-right");
    slide = 1;
}
	else {
		$("#next-steps").animate({marginLeft:'0px'}, 'slow');   
		$("#content").animate({marginLeft:'225px', paddingRight:'40px', width:'62%'}, 'slow');   
		 $("#content-wrap").animate({ width:'90%'}, 'slow');  
		$("#button").attr('class',"icon-chevron-left");
    slide = 0;
	}
});
});