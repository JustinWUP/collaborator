$(document).ready(function(){
	x = "<%= @wiki.title.downcase %>/";
	
	converter = new Markdown.Converter()
	if( $('#wiki_body').val() != '' ) {
  		$('.wiki_preview').empty().append(converter.makeHtml($('#wiki_body').val()))
  		linkfixer();
	}
    $('#wiki_body').keyup(function(){
    	$('.wiki_preview').empty().append(converter.makeHtml($('#wiki_body').val()))
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
});