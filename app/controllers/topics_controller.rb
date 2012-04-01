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

    last_page = params[:last_page] || 'None'

    @topic = Github::Issue.new({gh_user: user, gh_repo: repo})
    @topic.title = params[:github_issue][:title]
    @topic.body = "<<HEADSTART"
    @topic.body << "\nTopic Opened By: " + current_user.email
    @topic.body << "\nBrowser/OS: " + request.env["HTTP_USER_AGENT"] 
    @topic.body << "\nLast Page Viewed: " + last_page
    @topic.body << "\nDescription: " + params[:github_issue][:body]
    label = @project.auto_tag
    @topic.labels = [label.to_s] if label

    if @topic.save 
      respond_with(@topic, location: project_path(@project))
      flash[:notice] = "Your topic was successfully created."
    end 
  end

  private 

  def find_topic
  	@topic = @project.topics.find(params[:id])	

    regex = Regexp.new(/<<HEADSTART(.*)Description:/m)
    if regex.match(@topic.body)
     @topic.body[regex] = "" if @topic.body[regex]
    end

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
