class IssuesController <  ApplicationController
	before_filter :find_project
	before_filter :find_issue
	before_filter :find_comments

  load_and_authorize_resource :project, :through => :current_user

  def show
     
  end

  private 

  def find_issue
  	@issue = @project.find_issue(params[:issue_id])	
    if not @issue then redirect_to @project, alert: "Issue not found" end
  end

  def find_comments
  	@comments = @project.get_comments(@issue)
  end

   def find_project
    id = params[:project_id]
    @project = Project.find(id)
    authorize! :read, @project
  end

end
