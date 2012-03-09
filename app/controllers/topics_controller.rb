class TopicsController <  ApplicationController
	respond_to :html, :js
  
  before_filter :find_project
  # before_filter :find_all_projects
	before_filter :find_topic, except: [:new, :create]
	before_filter :find_comments, except: [:new, :create]

  load_and_authorize_resource :project, :through => :current_user

  def show
     @comment = Github::Comment.new
  end

  def new
    @topic = Github::Issue.new
  end

  def create
    # ActiveResource does not protect against mass assignment
    # Manually build and assign attributes.
    user, repo = @project.repo.split('/')
    @topic = Github::Issue.new({gh_user: user, gh_repo: repo})

    @topic.title = params[:github_issue][:title]
    @topic.body = params[:github_issue][:body]
    
    @topic.save

    respond_with(@topic, location: project_path(@project))
  end

  private 

  def find_topic
  	@topic = @project.topics.find(params[:id])	
    if not @topic then redirect_to @project, alert: "Topic not found" end
  end

  def find_comments
  	@comments = Github::Comment.find_by_topic(@topic)
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
