class Comment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :topic
  belongs_to :user
  has_many :subscriptions, :as => :subscribable
  validates :user, :body, :presence => true

  def parent
     topic
  end
end
