class IssuesController <  ApplicationController
	before_filter :find_project
	before_filter :find_issue
	before_filter :find_comments

  load_and_authorize_resource :project, :through => :current_user

  def show
     
  end

  private 

  def find_issue
  	@issue = @octokit.issue(@project.repo, params[:issue_id])	
  end

  def find_comments
  	@comments = @octokit.issue_comments(@project.repo, params[:issue_id])
  end

   def find_project
    id = params[:project_id]
    @project = Project.find(id)
    authorize! :read, @project
    @issues = []
  end

end
