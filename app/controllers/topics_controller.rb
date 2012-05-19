class TopicsController <  ApplicationController
  respond_to :html, :js
  
  before_filter :find_topic, except: [:index, :new, :create]
  before_filter :find_subscription, :only => :show

  load_and_authorize_resource :project, :through => :current_user

  def index
    @project = Project.find(params[:project_id])
    redirect_to project_path(@project)  
  end

  def show
    if @topic.hoursused and @topic.hoursreq
      @topic.overage = @topic.hoursused - @topic.hoursreq 
    end
   

    unless @topic.hoursused.to_f == 0.0
      @topic.amountcomplete = @topic.hoursused.to_f / @topic.hoursreq.to_f
     
    else
      @topic.amountcomplete = 0.0
    end

    if @topic.topiccomplete == false && @topic.amountcomplete > 1  && @topic.overage > 0
      @topic.amountcomplete = 0.9
     
    elsif @topic.topiccomplete == true
      @topic.amountcomplete=1
    end
    
    @topic.save

    @comment = Comment.new
  end

  def new
    # @topic = Github::Issue.new
    @topic = @project.topics.build
  end

  def create
    @project = Project.find(params[:project_id])
    @topic = @project.topics.build(params[:topic])

    @topic.save

    respond_with @topic, :location => project_path(@topic.project)
  end


  def edit
    @topic.update_attributes(params[:topic])


    @topic.overage = @topic.hoursused - @topic.hoursreq 
    @topic.save
    
    unless @topic.hoursused.to_f == 0.0
      @topic.amountcomplete = @topic.hoursused.to_f / @topic.hoursreq.to_f
      @topic.save
    else
      @topic.amountcomplete = 0.0
    end

    if @topic.topiccomplete == false && @topic.amountcomplete > 1  && @topic.overage > 0
      @topic.amountcomplete = 0.9
      @topic.save
    elsif @topic.topiccomplete == true
      @topic.amountcomplete=1
      @topic.save
    end
    @comment = Comment.new
    
  end

  def update
    @topic.update_attributes(params[:topic])
    # respond_with @topic, location: project_topics_url
    respond_with(@topic, location: project_topic_path(@topic.project, @topic))
    #     @topic.overage = @topic.hoursused - @topic.hoursreq 
    # @topic.save
    # @topic.amountcomplete = @topic.hoursused.to_f / @topic.hoursreq.to_f
    # @topic.save

    @topic.overage = @topic.hoursused - @topic.hoursreq 
    @topic.save

    unless @topic.hoursused.to_f == 0.0
      @topic.amountcomplete = @topic.hoursused.to_f / @topic.hoursreq.to_f
      @topic.save
    else
      @topic.amountcomplete = 0.0
    end

    if @topic.topiccomplete == false && @topic.amountcomplete > 1  && @topic.overage > 0
      @topic.amountcomplete = 0.9
      @topic.save
    elsif @topic.topiccomplete == true
      @topic.amountcomplete=1
      @topic.save
    end
    @comment = Comment.new

  end

  private 

  def find_topic
    @topic = Topic.find(params[:id])
  end

  def find_subscription
    # TODO: This should be find_or_create_by_type(id, type)
    @subscription = current_user.subscriptions.where(:subscribable_id => @topic.id, :subscribable_type => 'Topic').first
    unless @subscription then
      @subscription = @topic.subscriptions.build
      @subscription.user = current_user
      @subscription.save
    end
  end


end
