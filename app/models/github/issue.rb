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

		issues.each do |issue|
			issue.project = project # round and round the circle goes..
		end

		return issues
	end

	###############
	private 
	##############

	# This applies methods to Issue collection returned from retrieval
	def self.apply_issues_methods(issues)
		class << issues
			def find(id)
				id = Integer(id) # We want an error if bad value
				found = self.detect {|issue| issue.number == id}
			end
		end

		return issues
	end
end
