class ApplicationController < ActionController::Base
  
	protect_from_forgery

	before_filter :authenticate_user!
	before_filter :auth_octokit

	check_authorization :unless => :devise_controller?

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_url, :alert => exception.message
	end

	private 

 	def auth_octokit
	    uname = Setting.find_by_key('robot_login')
	    pass = Setting.find_by_key('robot_password')
	    @octokit = Octokit::Client.new(:login => uname.value, :password => pass.value)
  	end
end
