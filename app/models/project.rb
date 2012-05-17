class Project < ActiveRecord::Base
	# include OctokitManager



	# Issues model is ActiveResource. Virtual attriburte 
	# simulates nested resource

	has_many :assignments
	has_many :users, :through => :assignments
	has_many :topics
	# has_many :labels

	# validate :auto_tag_is_functional

	validates :retainer_hours, :numericality => { :greater_than_or_equal_to => 0 } 
	validates :name, :presence => true
	validates :repo, :presence => true
	validates :url, :presence => true, :format => { :with=>Regexp.new("http:\\/\\/",Regexp::IGNORECASE), :message => "must start with http://"}


	# after_find :auth_octokit
	# after_find :populate_topics

  after_initialize :init
	def init
    # TODO: SQL Defaults are better. But these values may not exist after a few revisions
		self.retainer_hours ||= 0
		self.retainer_expiration ||= Time.now
	end

end
