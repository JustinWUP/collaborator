class Github::Label < ActiveResource::Base
	extend GithubResource

	self.site = 'https://api.github.com/repos/:user/:repo'
end
