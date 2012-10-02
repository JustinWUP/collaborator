class Organization < ActiveRecord::Base
	has_many :users
	validates :name, :presence => true
	validates :org_id, :presence => true
	default_scope :order => ("name ASC")
end
