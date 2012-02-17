module GithubbugOctokit
 	def auth_octokit
	    uname = Setting.find_by_key('robot_login')
	    pass = Setting.find_by_key('robot_password')
	    @octokit = Octokit::Client.new(:login => uname.value, :password => pass.value)
  	end
end