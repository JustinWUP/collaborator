class Wiki < ActiveRecord::Base
  attr_accessible :body, :title
  scope :recent, :order => 'updated_at DESC', :conditions => 'title != "Home"'
end
