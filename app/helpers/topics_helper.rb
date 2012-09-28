module TopicsHelper
	def http_referer_helper
		# This creates a variable containing the page the bug report button was pressed from.
	    last_page = request.env["HTTP_REFERER"] || "None"
	    if last_page.include?('localhost') || last_page.include?('collaborator')
	        last_page= 'None'
	    end 

	 	environment = request.env["HTTP_USER_AGENT"] || "None"

	 	topicreport = last_page + "," + environment
	 	reportsplit = topicreport.split(",",2)
	 	reportsplit

	end

end
