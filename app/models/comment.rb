class Comment < GitHubResource
	self.site = 'https://api.github.com/repos/:user/:repo/issues/:id'
end