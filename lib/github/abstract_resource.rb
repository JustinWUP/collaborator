class Github::AbstractResource < ActiveResource::Base
	self.format = :json

	# Since root key overrides, this line isn't necessary. http://bit.ly/wUriOb
	# self.include_root_in_json = false

   	def to_json(options={})
   		# We do not want root element in json for Github
	 	super({ :root => nil }.merge(options))
    end

	class << self 
	    def user
			Setting.find_by_key('robot_login').value
		end

		def password
			Setting.find_by_key('robot_password').value
		end

		######
		# GitHub's Issues API (v3) does not use format extensions for resources
		# This overrides element/collection strings, removing extention. Also, 
		# for retrieving all collections, GitHub uses GET /repos/:user/:repo/:collection 
		# instead of GET /repos/:user/:repo/:collection/all.json. 
		########################################################################
		def element_path(id, prefix_options = {}, query_options = nil)
			check_prefix_options(prefix_options)

			prefix_options, query_options = split_options(prefix_options) if query_options.nil?
			element = "/#{URI.parser.escape id.to_s}" unless id.to_s == 'all'
			"#{prefix(prefix_options)}#{collection_name}#{element}#{query_string(query_options)}"
		end

		def collection_path(prefix_options = {}, query_options = nil)
			check_prefix_options(prefix_options)
			prefix_options, query_options = split_options(prefix_options) if query_options.nil?
			"#{prefix(prefix_options)}#{collection_name}#{query_string(query_options)}"
		end
	end

end