class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  attr_accessible :body, :title, :changed_by, :changetag, :postcategory
  validates_presence_of :body, :title, :changetag
  validates_format_of :postcategory, :with => /^[A-Za-z\d-]+$/,  :allow_blank => true, :message => "can only be alphanumeric with no spaces"
  audit :body, :title
  scope :recent, :order => 'updated_at DESC'
end
