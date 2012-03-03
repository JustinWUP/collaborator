module OctokitManager

	def octokit 
		raise "Octokit is disabled!"
		uname = Setting.find_by_key('robot_login') 
		pass = Setting.find_by_key('robot_password')

	    if uname && pass
	    	octokit = Octokit::Client.new(:login => uname.value, :password => pass.value, :auto_traversal => true)
	    else
	    	octokit = Octokit::Client.new(:auto_traversal => true)
	    end

	    return octokit
	end
end