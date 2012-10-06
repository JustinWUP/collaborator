module WikisHelper
	def wiki_body(content)
		BlueCloth.new(content).to_html.html_safe
	end

	 def category_list(category)
		
	 	
	 end

end
