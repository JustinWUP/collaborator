class Project < ActiveRecord::Base
	has_many :assignments
	# has_many :issues
	has_many :users, :through => :assignments
	has_many :labels
end
