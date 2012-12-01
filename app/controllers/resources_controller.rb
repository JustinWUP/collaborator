class ResourcesController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  load_and_authorize_resource
  before_filter :find_tasks

  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  def today
     render :layout => false
  end

  def week
    render :layout => false
  end

  def active
    @active = @tasks.active
    render :layout => false
  end

  private 
  	def find_tasks
  		@tasks = Task.accessible_by(current_ability)
  	end

end