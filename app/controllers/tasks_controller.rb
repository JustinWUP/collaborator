class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  load_and_authorize_resource

  helper_method :englishtime
  before_filter :find_topic
  after_filter :sumalltime, :only => [:update, :create, :destroy]
  # after_filter :timeconvert, :only => [:update]
  before_filter :sumtasktime, :only => [:show, :charge]

  def index
    @tasks = @topic.tasks.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = @topic.tasks.new(:topic_id => params[:topic_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = @topic.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @topic.tasks.new(params[:task])

    respond_to do |format|
      if @task.save
        format.html { redirect_to topic_task_path(@topic, @task) }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = @topic.tasks.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        if params[:task][:time]
          @task.audit_tag_with(@task.changetag)
        end  
        @task.time = "0.0"
        @task.save

        format.html { redirect_to topic_task_path(@topic), notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = @topic.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to topic_tasks_url(@topic) }
      format.json { head :no_content }
    end
  end

  def charge
    if @topic.project.retainer_hours >= @showsum
      @topic.project.retainer_hours -= @showsum
    else
      @topic.project.retainer_hours = 0
    end
    @topic.project.save 
    @task.billable = true
    @task.wasbilled = true
    @task.active = false
    @task.audit_tag_with('Billed ' + englishtime(@showsum).to_s + ' to retainer.')
    @task.save
    redirect_to topic_task_path(@topic), notice: 'This task was charged against the client retainer.'
  end

  def review
    @task.active = false
    @task.audit_tag_with('Marked for review.')
    @task.save
    
    hey = @task.topic.id
    taskname = @task.name
    taskid = @task.id

    Notifier.task_review(hey,taskname,taskid).deliver
    
    redirect_to topic_task_path (@topic), notice: 'This task has been marked for review.'
  end 

  def approve
    @task.audit_tag_with('Task approved.')
    @task.save
    hey = @task.topic.id
    taskname = @task.name
    taskid = @task.id

    @task.user_ids.each do |subscription| 
      lookup = User.find_by_id(subscription) 
      Notifier.task_approve(lookup,hey,taskname,taskid).deliver unless lookup == current_user
    end
    
    redirect_to topic_task_path (@topic), notice: 'Task was approved.'
  end

  private

    def englishtime(time)
      @timeeng = time.to_s.split(".",2)
      @minssalt = '.' + @timeeng.last
      @minsraw = (@minssalt.to_d * 0.6) * 100
      @minseng = @minsraw.to_s.split(".",2)
      # TODO: i18n these models.
      if @timeeng.first != "0" and @timeeng.first != "00"
        return @timeeng.first + ' hours and ' + @minseng.first + ' minutes'
      else
        return @minseng.first + ' minutes'
      end
  end
    def find_topic
      @topic = Topic.find(params[:topic_id])
      @project = @topic.project_id
    end

    def sumalltime
      @timesum = 0.0 
      @topic.tasks.each do |task|
        task.audits.each do |time| 
          time.modifications['time'] 
          @timesum += time.modifications['time'].to_f 
        end 
      end
      @topic.hoursused = @timesum
      @topic.save

    end

    def sumtasktime
      @task = @topic.tasks.find(params[:id])
      @showsum = 0.0
      @task.audits.each do |time|
        @showsum += time.modifications['time'].to_f
      end
    end

    # def timeconvert
      #  if @task.time.include? ':'
      #   @timesplitters = @task.time.split(":",2)
      #   @mins_raw = (@timesplitters.last.to_d / 100) / 0.6
      #   @minseng = @mins_raw.to_s.split(".",2)
      #   @hours = @timesplitters.first
      #   @formattedtime = @hours.to_s + '.' + (@minseng.last).to_s
      #   @task.time = @formattedtime
      #   @task.save
      # end
    # end

end











