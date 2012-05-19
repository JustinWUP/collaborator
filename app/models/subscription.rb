class Subscription < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user

  # TODO: Validate subscriptioni doesn't exist

  def enabled?
    return enabled
  end
  alias :subscribed? :enabled?

  def self.find_or_create_by_type(current_user, type)
    subscription = current_user.subscriptions.where(:subscribable_id => type.id, :subscribable_type => type.class.to_s).first
    unless subscription then
      subscription = type.subscriptions.build
      subscription.user = current_user
      subscription.save
    end

    return subscription
  end
end
