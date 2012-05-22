class ProjectsController < ApplicationController
  # Load first.. 
  load_and_authorize_resource
  # ..then filter  
  before_filter :filter_index, :only => :index

  def create
    @project = Project.new(params[:project])  
    if @project.save
      redirect_to(@project)
    else
      render :new
    end
  end

  def destroy
    @project.destroy
    flash[:notice] = 'Project destroyed.'
    redirect_to :back
  end

  private

  def filter_index
    @projects = Project.accessible_by(current_ability)
  end
end
