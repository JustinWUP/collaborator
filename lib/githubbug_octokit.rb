module GithubbugOctokit
 	def auth_octokit
	    uname = Setting.find_by_key('robot_login') 
	    pass = Setting.find_by_key('robot_password') 
	    if uname && pass
	    	@octokit = Octokit::Client.new(:login => uname.value, :password => pass.value, :auto_traversal => true)
	    else
	    	@octokit = Octokit::Client.new(:auto_traversal => true)
	    end
  	end
end