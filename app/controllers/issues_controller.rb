class IssuesController <  ApplicationController
	before_filter :find_project
  before_filter :find_all_projects
	before_filter :find_issue
	before_filter :find_comments

  # load_and_authorize_resource :project, :through => :current_user

  def show
     
  end

  private 

  def find_issue
  	@issue = @project.issues.find(params[:issue_id])	
    if not @issue then redirect_to @project, alert: "Issue not found" end
  end

  def find_comments
  	@comments = Comment.find_by_issue(@issue)
  end

   def find_project
    id = params[:project_id]
    @project = Project.find(id)
    authorize! :read, @project
  end

  def find_all_projects
    @projects = Project.accessible_by(current_ability)
  end

end
