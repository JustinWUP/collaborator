$(document).ready(function(){

	x = $('#titlemunch').text() + '/';
  btn_clicked = false;
  changed = false;


  $('input[type="submit"]').click(function(){
    btn_clicked = true; 
  });

	converter = new Markdown.Converter()

	if( $('#wiki_body').val() != '' ) {
  		$('.wiki_preview').empty().append(converter.makeHtml($('#wiki_body').val()));
  		linkfixer();
	}
    $('#wiki_body').keyup(function(){
    	$('.wiki_preview').empty().append(converter.makeHtml($('#wiki_body').val()));
      changed = true;
    	linkfixer();
    });
      
	function linkfixer(){
 
    $('.wiki_preview a').each(function(){
      if(this.href.match(['localhost' || 'ghb' || 'collaborator'])){
        if(this.href.match("~~")){
          link = this.href.replace('~~', '');
        }
    
      else if(this.href.match("~")){
          link = this.href.replace('~', 'cate/');
        }

      this.href = link.replace(x, '');
      }

      else {
        this.href = this.href;
      }

    });
  }

    window.onbeforeunload = function(){
      if(btn_clicked == false && changed == true) {
              return "Don't forget to save your article!";
      }
    }

});