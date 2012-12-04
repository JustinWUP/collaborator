$(document).ready(function(){

	x = "<%= @wiki.title.downcase %>/";
  btn_clicked = false;
  burger = false;


  $('input[type="submit"]').click(function(){
    btn_clicked = true; 
  });

	converter = new Markdown.Converter()

	if( $('#wiki_body').val() != '' ) {
  		$('.wiki_preview').empty().append(converter.makeHtml($('#wiki_body').val()))
  		linkfixer();
	}
    $('#wiki_body').keyup(function(){
    	$('.wiki_preview').empty().append(converter.makeHtml($('#wiki_body').val()));
      burger = true;
    	linkfixer();
    });
      
	function linkfixer(){
	$('.wiki_preview a').each(function(){
		if(this.href.match("~~")){
    		link = this.href.replace('~~', '');
  		}
  
 		else if(this.href.match("~")){
    		link = this.href.replace('~', 'cate/');
  		}

  		this.href = link.replace(x, '');
    });
	}

    window.onbeforeunload = function(){
      if(btn_clicked == false && burger == true) {
              return "Don't forget to save your article!";
      }
    }

});