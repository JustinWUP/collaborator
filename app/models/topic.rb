require 'parent_resource'
class Topic < ActiveRecord::Base

  attr_accessible :body, :title, :hoursreq, :hoursused, :topiccomplete, :overage, :amountcomplete
  belongs_to :project
  parent_resource :project
  belongs_to :user
  has_many :comments
  has_many :subscriptions, :as => :subscribable, :dependent => :destroy
  validates :hoursreq, :numericality => { :greater_than_or_equal_to => 0 } 
  validates :hoursused, :numericality => { :greater_than_or_equal_to => 0 }
  validates :title, :presence => true

  after_initialize :init
  def init
    self.hoursreq ||= 0
    self.hoursused ||= 0
  end
end
