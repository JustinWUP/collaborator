require 'parent_resource'
class Topic < ActiveRecord::Base

  attr_accessible :body, :title, :hoursreq, :hoursused, :overage, :amountcomplete, :work_status, :topic_tag, :report_lastpage, :report_environment
  belongs_to :project
  parent_resource :project
  belongs_to :user
  has_many :comments
  # scope :active, :conditions => { :topiccomplete => false }
  # scope :complete, :conditions => { :topiccomplete => true, :awaitingapproval => false }
  # scope :topic_for_approval, :conditions => {:awaitingapproval => true }
  scope :active, :conditions => {:work_status => 1}, :order => 'updated_at DESC'
   scope :topic_for_approval, :conditions => {:work_status => 2} , :order => 'updated_at DESC'
  scope :complete, :conditions => {:work_status => 3}, :order => 'updated_at DESC'

  has_many :subscriptions, :as => :subscribable, :dependent => :destroy
  validates :hoursreq, :numericality => { :greater_than_or_equal_to => 0 } 
  validates :hoursused, :numericality => { :greater_than_or_equal_to => 0 }
  validates :title, :presence => true
  attr_accessible :attachments_attributes
  has_many :attachments, :dependent => :destroy
   accepts_nested_attributes_for :attachments, :allow_destroy => true
  # has_attached_file :attachment,
  #                   :storage => :Dropboxstorage,
  #                   :path => "/Collaborator/:attachment/:id/:style/:filename"

  after_initialize :init
  def init
    self.hoursreq ||= 0
    self.hoursused ||= 0
  end
end
