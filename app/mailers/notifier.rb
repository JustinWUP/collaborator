class Notifier < ActionMailer::Base
  default from: "WUP Notifications <notifications@winduppixel.com>"

  def subscription_email(subscription)
    @resource = subscription.subscribable_type.classify.constantize.find(subscription.subscribable_id)
    @type = subscription.subscribable_type.to_s.humanize
    @user = subscription.user

    @link = nested_resource_link(@resource)
    mail(:to => @user.email, :subject => "#{@resource.class.to_s.humanize} has been updated.")
  end

  def nested_resource_link
    link = ""
    
    # TODO: Make this return a link to nested resource
    #
    # Code from StackOverflow:
    #
    # resource = Comment.first
    # resource_name = resource.class.to_s.downcase 
    #
    # helper = Rails.application.routes.named_routes.helpers.grep(/.*#{resource_name}_path$/).first.to_s.split('_')
    # built = helper.slice!(-2,2) # Shortest possible valid helper, "comment_path"
    #
    # while !(app.respond_to?(built.join("_").to_sym)) 
    #   built.unshift helper.pop
    # end
    #
    # built.pop # Get rid of "path"
    # resources = built.reverse.reduce([]) { |memo, name| 
    #   if name == resource_name
    #     memo << resource
    #   else
    #     memo <<  memo.last.send(name.to_sym) # comment.topic, or topic.project (depends on belongs_to)
    #   end
    # }
    # resources.reverse!
    #
    # app.polymorphic_url(resources) # "http://www.example.com/projects/1/topics/1/comments/1" 
    
    return link
  end
end
