class Topic < ActiveRecord::Base
  attr_accessible :body, :title, :hoursreq, :hoursused, :topiccomplete, :overage, :amountcomplete
  belongs_to :project
  belongs_to :user
  has_many :comments
  validates :hoursreq, :numericality => { :greater_than_or_equal_to => 0 } 
  validates :hoursused, :numericality => { :greater_than_or_equal_to => 0 }
  validates :title, :presence => true


  after_initialize :init
  def init
    self.hoursreq ||= 0
    self.hoursused ||= 0
  end
end
