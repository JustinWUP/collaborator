class ProjectsController < ApplicationController
  # Load first.. 
  load_and_authorize_resource
  # ..then filter  
  before_filter :filter_index, :only => :index

  def create
    @project = Project.new(params[:project])  
    if @project.save
      
    else
      render :new
    end
  end

  private

  def filter_index
    @projects = Project.accessible_by(current_ability)
  end
end
