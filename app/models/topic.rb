class Topic < ActiveRecord::Base
  attr_accessible :body, :title, :hoursreq, :hoursused
  belongs_to :project
  belongs_to :user
  has_many :comments
end
