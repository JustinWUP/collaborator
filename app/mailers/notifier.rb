class Notifier < ActionMailer::Base
  default from: "WUP Notifications <notifications@winduppixel.com>"

  def subscription_email(subscription)
    @parent = subscription.subscribable_type.classify.constantize.find(subscription.subscribable_id)
    @type = subscription.subscribable_type.to_s.humanize
    @user = subscription.user
    mail(:to => @user.email, :subject => "#{@parent.class.to_s.humanize} has been updated.")
  end

end
