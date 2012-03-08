class Github::AbstractResource < ActiveResource::Base
	extend GithubResource
	self.format = :json

	# We do not want root element in json
	# Since root key overrides, this line isn't necessary. http://bit.ly/wUriOb
	# self.include_root_in_json = false

   	def to_json(options={})
   		# We do not want root for Github.. times two.
	 	super({ :root => nil }.merge(options))
    end
end