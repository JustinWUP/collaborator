class Github::Issue < ActiveResource::Base
	extend GithubResource

	self.site = 'https://api.github.com/repos/:user/:repo'

	attr_accessor :project

	# Disable self.all
	private_class_method :all
	# Gets all issues for a given project
	def self.find_by_project(project)
		user, repo = project.repo.split('/') # hack. should be added to Project model as separate fields
		issues = self.find(:all, :params => {:repo => repo, :user => user} )

		apply_issues_methods(issues)

		# issues.filter_by_project(project)

		return issues
	end

	###############
	private 

	# This applies methods to Issue collection returned from retrieval
	def self.apply_issues_methods(issues)
		class << issues
			def find(id)
				id = Integer(id) # We want an error if bad value
				found = self.detect {|issue| issue.number == id}
			end

			def filter_by_project(project)
				enabled_labels = project.labels.find_all_by_enabled(true) || []

		   		label_list = []
			    
			    for label in enabled_labels
			      label_list << label.name
			    end

			
			    if label_list.empty?
			      issues = []
			    else
			      issues = @octokit.issues(repo, {:labels => label_list.join(",")} )
			    end

			    issues_hash = {}
			    
			    issues.each do |issue| 
			      
			      issue.labels.each do |label|
			        if not label_list.include?(label.name)
			          issue.labels.delete(label) 
			        end
			      end
			      
			      issues_hash[issue.number] = issue
			    end
			    
			 #    self.issues = issues_hash

				issues.each do |issue|

					issue.project = project # round and round the circle goes..
				end
			end
		end

		return issues
	end
end
