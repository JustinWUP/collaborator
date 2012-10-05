class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  attr_accessible :body, :title
  scope :recent, :order => 'updated_at DESC', :conditions => 'title != "Home"'
end
