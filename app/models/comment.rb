class Comment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :topic
  belongs_to :user
  has_many :subscriptions, :as => :subscribable

  validates :user, :body, :presence => true

  def notify_subscribers
    subscribers = self.topic.subscriptions.where(:enabled => true)
    everyone = subscribers.inject([]) do |x, subscriber|
      x << subscriber.user.email
    end
    return everyone
  end
end
