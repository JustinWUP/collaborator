class Project < ActiveRecord::Base
	# include OctokitManager

	# Issues model is ActiveResource. Virtual attriburte 
	# simulates nested resource
	attr_accessor :issues
	after_find :populate_issues

	has_many :assignments
	has_many :users, :through => :assignments
	has_many :labels

	# after_find :auth_octokit
	# after_find :populate_issues

	def populate_issues
		self.issues = Issue.all(self)
	end

	def find_issue(id)
		raise "Method deprecated!"
		self.issues[id.to_i]
	end

	def get_comments
		raise "Method moved to Issues model"
	end

	def update_edit_date
		raise "Method disabled!"
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

	def get_labels
		raise "Method disabled!"
		begin
			labels = octokit.labels(repo)
		rescue Octokit::Error => e 
			logger.error "Error!! #{e.message}"
			labels = []
		end
		return labels
	end
	
	def update_labels(updated_labels)
      all_labels = labels.find(:all)

      for label in all_labels
        label.update_attribute(:enabled, !!updated_labels.include?(label.id.to_s))
      end
	end

	def refresh_labels
		external_labels = get_labels

   		external_labels.each do |label|
			unless labels.find_by_name(label.name) 
				labels.build({name: label.name, color: label.color}).save
			end
	    end

	    return labels
	end
end
