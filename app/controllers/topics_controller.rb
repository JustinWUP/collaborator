class TopicsController <  ApplicationController
  respond_to :html, :js
  # load_and_authorize_resource :project, :through => :current_user
  load_and_authorize_resource :project
  load_and_authorize_resource :through => :project
  # before_filter :find_topic, except: [:index, :new, :create]
  before_filter :find_subscription, :only => :show

  def index
    redirect_to project_path(@project)  
  end

  def show
    # TODO: All this business code needs to be moved to Models
    if @topic.hoursused and @topic.hoursreq
      @topic.overage = @topic.hoursused - @topic.hoursreq 
    end
   

    unless @topic.hoursused.to_f == 0.0
      @topic.amountcomplete = @topic.hoursused.to_f / @topic.hoursreq.to_f
     
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
    5.times { @topic.attachments.build }  
  end

  def create
    @topic = @project.topics.build(params[:topic])
    @topic.save
    respond_with @topic, :location => project_path(@topic.project)

  end

def attach
  @topic.update_attributes(params[:topic])
end


  def edit
    
    @topic.update_attributes(params[:topic])
 
    # TODO: Move business logic to Model
    @topic.overage = @topic.hoursused - @topic.hoursreq 
    @topic.save
    
    unless @topic.hoursused.to_f == 0.0
      @topic.amountcomplete = @topic.hoursused.to_f / @topic.hoursreq.to_f
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
    respond_with(@topic, location: project_topic_path(@topic.project, @topic))
    #     @topic.overage = @topic.hoursused - @topic.hoursreq 
    # @topic.save
    # @topic.amountcomplete = @topic.hoursused.to_f / @topic.hoursreq.to_f
    # @topic.save

    # TODO: Move business logic to Model
    @topic.overage = @topic.hoursused - @topic.hoursreq 
    @topic.save

    unless @topic.hoursused.to_f == 0.0
      @topic.amountcomplete = @topic.hoursused.to_f / @topic.hoursreq.to_f
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

  private 

  def find_subscription
    @subscription = Subscription.find_or_create_by_type(current_user, @topic)
  end

end
