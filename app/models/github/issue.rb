class Github::Issue <  Github::AbstractResource

	self.site = 'https://api.github.com/repos/:gh_user/:gh_repo'
	self.schema = {'title' => :string, 'body' => :string}

	attr_accessor :project

	# Disable self.all
	private_class_method :all
	
	# Gets all issues for a given project
	def self.find_by_project(project)
		user, repo = project.repo.split('/') # hack. should be added to Project model as separate fields
		
		labels = project.labels.find_all_by_enabled(true) || []

		# Nah let's not do this for now..
		# return [] if labels.empty?

		# This is where the label filtering happens. GitHub will only return 
		# issues that match one of the labels in label_string.
		# Except that they updated their API and now it only returns issues 
		# that contain every label in the paramater
		label_string = labels.reduce([]) {|names, label| names << label.name }.join(',')
		label_string << "," unless label_string.empty?
		label_string << project.auto_tag unless project.auto_tag.empty?

		# params = {:gh_repo => repo, :gh_user => user, labels: label_string}
		# GitHub changed label filter from OR to AND, so now we have to filter ourselves
		params = {:gh_repo => repo, :gh_user => user}
		
		# IssuesCollection will filter out the auto_tag
		issues = IssuesCollection.new( self.find(:all, :params => params ), project )

		issues.each do |issue|
			issue.project = project # round and round the circle goes..
		end

		return issues
	end

	# IssuesCollection is just an array the applies label filters upon creation. 
	# it is also extended with #find(id)
	class IssuesCollection < Array
		def initialize(array, project, filter = true)
			super(array)
			filter_disabled_labels_by_project(project) if filter
		end

		def find(id)
			id = Integer(id) # We want an error if bad value
			found = self.detect {|issue| issue.number == id}
		end

		private 

		# This method removes labels from issues that are not enabled to 
		# be displayed on a given project, as well as auto_tag
		def filter_disabled_labels_by_project(project)
			issues = self

			enabled_labels = project.labels.find_all_by_enabled(true) || []

	   		label_list = []
		    
		    for label in enabled_labels
		      label_list << label.name
		    end

		    issues_hash = {}
		  
		    issues.each do |issue| 
		      	issue.labels.each_with_index do |label,index|
			        if not label_list.include?(label.name)
			        	# remove labels disabled in the filter list
	         	 		issue.labels.delete_at(index) 
	         	 	elsif project.auto_tag && label.name == project.auto_tag
	         	 		# remove auto_tag.
	         	 		# issue.labels.delete_at(index)
	         	 		label.name = "New Topic"
			        end
		    	end
	      	end
	    end # def filter_disabled_labels_by_project
	end # class IssuesCollection
end
