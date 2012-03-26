class Project < ActiveRecord::Base
	# include OctokitManager

	# Issues model is ActiveResource. Virtual attriburte 
	# simulates nested resource

	has_many :assignments
	has_many :users, :through => :assignments
	has_many :labels

	validate :auto_tag_is_functional

	validates :retainer_hours, :numericality => { :greater_than_or_equal_to => 0 } 
	validates :name, :presence => true
	validates :repo, :presence => true
	validates :url, :presence => true, :format => { :with=>Regexp.new("http:\\/\\/",Regexp::IGNORECASE), :message => "must start with http://"}
	after_initialize :init

	# after_find :auth_octokit
	# after_find :populate_topics

	def init
		self.retainer_hours ||= 0
		self.retainer_expiration ||= Time.now
	end

	def topics
		Github::Issue.find_by_project(self)
	end

	def find_topic(id)
		raise NotImplementedError, "Method disabled!"
		self.topics[id.to_i]
	end

	def get_comments
		raise NotImplementedError, "Method moved to Issues model"
	end

	def update_edit_date
		raise NotImplementedError, "Method disabled!"
		# date_updated_on is a poor form of 
		# caching that uses the DB
		self.date_updated_on ||= Time.new(0)

		# Change the time to avoid swamping github
		if date_updated_on <= 10.minutes.ago
			self.edit_date = Time.parse(octokit.repo(repo).pushed_at) 
			self.date_updated_on = Time.now

		end
		self.save!
	end

	def refresh_labels
		external_labels = Github::Label.find_by_project(self)
		all_labels = labels.find(:all)

		# Compare external labels against existing labels, update or create.
   		external_labels.each do |label|
			found = labels.find_by_name(label.name) 
			if found
				found.update_attributes({name: label.name, color: label.color})
			else
				labels.build({name: label.name, color: label.color}).save
			end
	    end

	    # Compare existing labels against external labels to make sure they still exist.
	    # Destroy if they don't.
	    all_labels.each do |label|
	    	found = external_labels.find_by_name(label.name)
	    	label.destroy unless found
	    end

	    return labels
	end

	def update_labels(updated_labels)
		all_labels = labels.find(:all)

		for label in all_labels
			label.update_attribute(:enabled, !!updated_labels.include?(label.id.to_s))
		end

		all_labels
	end

	private 

	def auto_tag_is_functional

	end
end
