class ProjectsController < ApplicationController
  
  before_filter :find_project, except: [:index, :new, :create] 
  # before_filter :refresh_labels, only: :edit
  # after_filter :delay_update_edit_date, only: :index
  
  load_and_authorize_resource :through => :current_user

  respond_to :html, :js

  # GET /projects
  # GET /projects.json
  def index
    # @projects = Project.accessible_by(current_user)
    if can? :manage, Project
      @projects = Project.all
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
   

  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

  end

  # GET /projects/1/edit
  def edit
    
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])

    @project.save

    respond_with @project, :location => projects_url

    # respond_to do |format|
    #   if @project.save
    #     format.html { redirect_to @project, notice: 'Project was successfully created.' }
    #     format.json { render json: @project, status: :created, location: @project }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @project.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    respond_to do |format|
      # If all set to zero..
      params[:project][:user_ids] ||= []
      # params[:enable_label] ||= []

      # no validation check needed. Boolean.
      # @project.update_labels(params[:enable_label])

      if @project.update_attributes(params[:project]) 
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    
    @project.destroy

    respond_with @project, location: projects_url
    # respond_to do |format|
    #   format.html { redirect_to projects_url }
    #   format.json { head :no_content }
    #   format.js
    # end
  end
  
  private

  def find_project
    id = params[:id]
    @project = Project.find(id)
    authorize! :read, @project
  end

  # def refresh_labels
  #   @labels = @project.refresh_labels
  # end

  # def delay_update_edit_date
  #   @projects.each { |project| project.delay.update_edit_date }
  # end
end
