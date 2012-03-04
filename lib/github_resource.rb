# extend, don't include, for class methods.
module GithubResource 
	format = :json

	def user
		if username = Setting.find_by_key('robot_login') 
			return username.value
		end
	end

	def password
		if password = Setting.find_by_key('robot_password') 
			return password.value
		end
	end

	######
	# GitHub's Issues API (v3) does not use format extensions for resources
	# This overrides element/collection strings, removing extention. Also, 
	# for retrieving all collections, GitHub uses GET /repos/:user/:repo/:collection 
	# instead of GET /repos/:user/:repo/issues/all.json. 
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
