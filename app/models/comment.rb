class Comment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :topic
  belongs_to :user

  validates :user, :body, :presence => true
end
