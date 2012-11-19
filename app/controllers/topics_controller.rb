class TopicsController <  ApplicationController
  respond_to :html, :js
  # load_and_authorize_resource :project, :through => :current_user
  load_and_authorize_resource :project
  load_and_authorize_resource :through => :project
  # before_filter :find_topic, except: [:index, :new, :create]
  before_filter :find_subscription, :only => :show
  before_filter :find_tasks, :only => :show
  before_filter :sumtime, :only => [:edit, :update, :show]

  def index
    redirect_to project_path(@project)  
  end

  def show
    # TODO: All this business code needs to be moved to Models
    if @topic.hoursused and @topic.hoursreq
      @topic.overage = @topic.hoursused - @topic.hoursreq 
    end
   

    unless @topic.hoursused == 0.0
      @topic.amountcomplete = @topic.hoursused/ @topic.hoursreq
     
    else
      @topic.amountcomplete = 0.0
    end

    if @topic.work_status < 3 && @topic.amountcomplete > 1  && @topic.overage > 0
      @topic.amountcomplete = 0.9
     
    elsif @topic.work_status == 3
      @topic.amountcomplete=1
    end
    
    @topic.save

    @comment = Comment.new
    @comment_page = @topic.comments.page(params[:page]).order('created_at DESC').per_page(5)

  end

  def new
    # @topic = Github::Issue.new
     #@post = Topic.new
    
    @topic = @project.topics.build
  end

  def create
    @topic = @project.topics.build(params[:topic])
    @topic.save
    hey = @topic.id
    projectname = @project.name
    projectid = @project.id
    @project.user_ids.each do |subscription| 
      lookup = User.find_by_id(subscription) 
      
      Notifier.topic_email(lookup,hey,projectname,projectid).deliver unless lookup == current_user or lookup.topicmail == false
    end
    respond_with(@topic, location: project_topic_path(@topic.project, @topic))
    flash[:notice] = 'Topic Submitted'
    # respond_with @topic, :location => project_path(@topic.project)

  end

def attach
  @topic.update_attributes(params[:attachments])
  5.times { @topic.attachments.build }
end


  def edit
    if current_user.role? :admin
    else
      redirect_to :back
    end

    # TODO: Move business logic to Model
    @topic.overage = @topic.hoursused - @topic.hoursreq 
    @topic.save
     5.times { @topic.attachments.build } 
    
    unless @topic.hoursused == 0.0
      @topic.amountcomplete = @topic.hoursused / @topic.hoursreq
      @topic.save
    else
      @topic.amountcomplete = 0.0
    end

    if @topic.work_status < 3 && @topic.amountcomplete > 1  && @topic.overage > 0
      @topic.amountcomplete = 0.9
      @topic.save
    elsif @topic.work_status == 3
      @topic.amountcomplete=1
      @topic.save
    end

    @comment = Comment.new
    
  end

  def update
    @topic.update_attributes(params[:topic])
    # respond_with @topic, location: project_topics_url
    if @topic.update_attributes(params[:attachment])
      respond_with(@topic, location: project_topic_path(@topic.project, @topic))
      Attachment.where(:attachment_file_name => nil).delete_all
    else
      render :action => 'attach'
    end
        

    #     @topic.overage = @topic.hoursused - @topic.hoursreq 
    # @topic.save
    # @topic.amountcomplete = @topic.hoursused.to_f / @topic.hoursreq.to_f
    # @topic.save

    # TODO: Move business logic to Model
    @topic.overage = @topic.hoursused - @topic.hoursreq 
    @topic.save
    unless @topic.hoursused == 0.0
      @topic.amountcomplete = @topic.hoursused / @topic.hoursreq
      @topic.save
    else
      @topic.amountcomplete = 0.0
    end

    if @topic.work_status < 3 && @topic.amountcomplete > 1  && @topic.overage > 0
      @topic.amountcomplete = 0.9
      @topic.save
    elsif @topic.work_status == 3
      @topic.amountcomplete=1
      @topic.save
    end
    @comment = Comment.new

  end

  def addmore
     @topic = Topic.find(params[:id])
      @topic.attachments.build 
       @topic.save
      redirect_to :back
end


  def authorize
    if params[:oauth_token] then
      dropbox_session = Dropbox::Session.deserialize(session[:dropbox_session])
      dropbox_session.authorize(params)
      session[:dropbox_session] = dropbox_session.serialize # re-serialize the authenticated session

      redirect_to :action => 'upload'
    else
      dropbox_session = Dropbox::Session.new('no9vn5wb40fgm05', 'obk9bj95z4shb8e')
      session[:dropbox_session] = dropbox_session.serialize
      redirect_to dropbox_session.authorize_url(:oauth_callback => url_for(:action => 'authorize'))
    end
  end

  def upload
    return redirect_to(:action => 'authorize') unless session[:dropbox_session]
    dropbox_session = Dropbox::Session.deserialize(session[:dropbox_session])
    return redirect_to(:action => 'authorize') unless dropbox_session.authorized?

    if request.method == :post then
      dropbox_session.upload params[:file], 'My Uploads'
      render :text => 'Uploaded OK'
    else
      render 'attach'
    end
  end

  private 

  def find_subscription
    @subscription = Subscription.find_or_create_by_type(current_user, @topic)
  end

  def find_tasks
    unless current_user.role? :admin 
      @tasks = Task.select {|obj| (obj.topic_id == @topic.id) and (obj.user_ids.include? current_user.id) }
    else
      @tasks = Task.find_all_by_topic_id(@topic)
    end
  end

  def sumtime
    
    if @topic.hoursused > 0
      if @topic.hoursreq == 0
        @topic.hoursreq = 1000000
      end
    end
    @topic.save
  end

end
