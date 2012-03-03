class Comment < ActiveResource::Base
	include GithubResource
	self.site = 'https://api.github.com/repos/:user/:repo/issues/:id'
end