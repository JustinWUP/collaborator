class Github::Label <  Github::AbstractResource

	self.site = 'https://api.github.com/repos/:gh_user/:gh_repo'

	def self.find_by_project(project)
		user, repo = project.repo.split('/')
		find(:all, params: {gh_user: user, gh_repo: repo})
	end
end
