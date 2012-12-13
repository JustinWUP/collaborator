class Notifier < ActionMailer::Base
  default from: "Wind Up Pixel Collaborator <mailer@winduppixel.com>"
  include ActionView::Helpers::TextHelper
  def subscription_email(subscription,topicid,projectid)

    @resource = subscription.subscribable_type.classify.constantize.find(subscription.subscribable_id)
    @type = subscription.subscribable_type.to_s.humanize
    @user = subscription.user

    # @resource_link = nested_resource_link
    @topicid = topicid
    @projectid = projectid

    @subjecttitle = @resource.title.to_s.humanize
    @shortsubjecttitle = truncate(@resource.title.to_s.humanize, :length => 20)
    # mail(:to => @user.email, :subject => "#{@resource.class.to_s.humanize} has been updated.")
    mail(:to => @user.email, :subject => "New update for #{@shortsubjecttitle}.")
  end

  def topic_email(subscription,topicid,projectname,projectid)

      @lookup = User.find_by_id(subscription) 

    # @resource_link = nested_resource_link
    @topicid = topicid
    @subjecttitle = projectname
    @projectid = projectid
    # mail(:to => @user.email, :subject => "#{@resource.class.to_s.humanize} has been updated.")
    mail(:to => @lookup.email, :subject => "#{@subjecttitle} has a new Topic.")
  end

  def task_review(topicid,taskname,taskid)
    @taskid = taskid
    @subjecttitle = taskname
    @topicid = topicid 
    mail(:to => 'justin@winduppixel.com', :subject => "#{@subjecttitle} has been marked for review.")
  end

  def task_approve(subscription,topicid,taskname,taskid)
    @lookup = User.find_by_id(subscription)
    @taskid = taskid
    @subjecttitle = taskname
    @topicid = topicid 
    mail(:to => @lookup.email, :subject => "#{@subjecttitle} has been approved.")
  end

  def task_decline(subscription,topicid,taskname,taskid)
    @lookup = User.find_by_id(subscription)
    @taskid = taskid
    @subjecttitle = taskname
    @topicid = topicid 
    mail(:to => @lookup.email, :subject => "#{@subjecttitle} has been declined.")
  end


  def nested_resource_link
    link = ""
    
    # TODO: Make this return a link to nested resource
    #
    # Code from StackOverflow:
    #
    resource = @resource
    resource_name = resource.class.to_s.downcase 
    
    helper = Rails.application.routes.named_routes.helpers.grep(/.*comment_path$/).first.to_s.split('_')
    built = helper.slice!(3,2) # Shortest possible valid helper, "comment_path"
    
    while !(respond_to?(built.join("_").to_sym)) 
      built.unshift helper.pop
    end
    
    built.pop # Get rid of "path"
    resources = built.reverse.reduce([]) { |memo, name| 
      if name == resource_name
        memo << resource
      else
        memo <<  memo.last.send(name.to_sym) # comment.topic, or topic.project (depends on belongs_to)
      end
    }
    resources.reverse!
    
    link = polymorphic_url(resources) # "http://www.example.com/projects/1/topics/1/comments/1" 
    
    return link
  end
end
