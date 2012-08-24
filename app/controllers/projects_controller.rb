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

    def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def filter_index
    @projects = Project.accessible_by(current_ability)
  end
end
