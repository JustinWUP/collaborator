class Github::Comment < ActiveResource::Base
	extend GithubResource

	self.site = 'https://api.github.com/repos/:user/:repo/issues'

	def self.find_by_issue(issue)
		# Get all comments by issue
		user, repo = issue.project.repo.split('/')
		id = issue.number
		
		find(:all, from: "/repos/#{user}/#{repo}/issues/#{id}/comments")
	end
end