class Github::Comment < Github::AbstractResource
	
	self.site = 'https://api.github.com/repos/:gh_user/:gh_repo/issues/:issue_id'

	self.schema = {'body' => :string }

	def self.find_by_topic(topic)
		# Get all comments by topic
		user, repo = topic.project.repo.split('/')
		id = topic.number
		opts = {gh_user: user, gh_repo: repo, issue_id: id}
	 	find(:all, params: opts)
	end
end