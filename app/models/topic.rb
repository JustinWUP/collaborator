class Topic < ActiveRecord::Base
  attr_accessible :body, :title, :hoursreq, :hoursused, :topiccomplete
  belongs_to :project
  belongs_to :user
  has_many :comments
  validates :hoursreq, :numericality => { :greater_than_or_equal_to => 0 } 
  validates :hoursused, :numericality => { :greater_than_or_equal_to => 0 } 
end