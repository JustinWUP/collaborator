class ProjectsController < ApplicationController

  load_and_authorize_resource

  make_resourceful do
    actions :all
    #before :index do
    #    if can? :manage, Project
    #      @projects = Project.all
    #    end
    #end

  end

  # Make_resourceful play nice with cancan...
  def current_objects
    @current_objects = Project.accessible_by(current_ability)
  end

end
