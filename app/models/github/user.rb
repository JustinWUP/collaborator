class Github::User < ActiveResource::Base
	extend GithubResource
	
	self.site = "https://api.github.com/users"
end