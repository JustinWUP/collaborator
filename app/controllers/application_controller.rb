class ApplicationController < ActionController::Base  
	protect_from_forgery

	before_filter :authenticate_user!
	before_filter :appname, :appbar

	check_authorization :unless => :devise_controller?

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to projects_url, :alert => "Access denied."
	end

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @whereami }
    end
  end

  def after_sign_in_path_for(resource)
    projects_path
  end

  # GET /apps/1
  # GET /apps/1.json

private 
  def appbar
    @appbar = App.all
  end
  
  def appname
    @appname = "COLLABORATOR"
  end
end


