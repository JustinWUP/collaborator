class Subscription < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :subscribable, :polymorphic => true
  default_scope :order => ['subscribable_id DESC'] and ['user_id ASC']
  # TODO: Change 'type' to a better name. It's passing an instance, not a pure type.
  # this method returns a subscription object that is disabled by default. 
  def self.find_or_create_by_type(current_user, type)
    subscription = current_user.subscriptions.where(:subscribable_id => type.id, :subscribable_type => type.class.to_s).first
    unless subscription then
      subscription = type.subscriptions.build
      subscription.user = current_user
      subscription.save
    end

    return subscription
  end

  # TODO: Validate subscription doesn't exist

  def enabled?
    return enabled
  end

  alias :subscribed? :enabled?

  def notify_by_email
    if enabled
      Notifier.subscription_email(self).deliver
    end
  end

end
