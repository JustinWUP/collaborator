class IssuesController <  ApplicationController
	respond_to :html, :js
  
  before_filter :find_project
  # before_filter :find_all_projects
	before_filter :find_issue, except: [:new, :create]
	before_filter :find_comments, except: [:new, :create]

  # load_and_authorize_resource :project, :through => :current_user

  def show
     
  end

  def new
    @issue = Github::Issue.new

  end

  def create
    # ActiveResource does not protect against mass assignment
    # Manually build and assign attributes.
    user, repo = @project.repo.split('/')
    @issue = Github::Issue.new({gh_user: user, gh_repo: repo})

    @issue.title = params[:github_issue][:title]
    @issue.body = params[:github_issue][:body]
    @issue.save

    respond_with(@issue, location: project_issue_path(@project, @isssue))
  end

  private 

  def find_issue
  	@issue = @project.issues.find(params[:issue_id])	
    if not @issue then redirect_to @project, alert: "Issue not found" end
  end

  def find_comments
  	@comments = Github::Comment.find_by_issue(@issue)
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
