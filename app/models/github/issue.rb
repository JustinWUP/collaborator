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
		return [] if labels.empty?

		label_string = labels.reduce([]) {|names, label| names << label.name }.join(',')

		params = {:gh_repo => repo, :gh_user => user, labels: label_string}
		
		issues = IssuesCollection.new( self.find(:all, :params => params ), project )

		issues.each do |issue|
			issue.project = project # round and round the circle goes..
		end

		return issues
	end

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
	         	 		issue.labels.delete_at(index) 
			        end
		    	end
	      	end
	    end # def filter_disabled_labels_by_project
	end # class IssuesCollection
end
