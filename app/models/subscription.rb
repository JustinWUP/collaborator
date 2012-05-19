class Subscription < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user

  # TODO: Validate subscriptioni doesn't exist

  def enabled?
    return enabled
  end
  alias :subscribed? :enabled?
end
