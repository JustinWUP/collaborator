class Github::Comment < Github::AbstractResource
	
	self.site = 'https://api.github.com/repos/:gh_user/:gh_repo/issues/:issue_id'

	self.schema = {'body' => :string }

	def self.find_by_topic(topic)
		# Get all comments by topic
		user, repo = topic.project.repo.split('/')
		id = topic.number
		opts = {gh_user: user, gh_repo: repo, issue_id: id}
	 	comments = find(:all, params: opts)
	 	filter_comments(comments)
	end

	private

	def self.filter_comments(comments)
		regex = /<<ROBOT:([0-9]*).*/
		
		comments.each do |comment|
			match = regex.match(comment.body)
			user_id = match[1] if match
			deleteduser = comment.body[regex]
			deleteduser = deleteduser.to_s
			deletedstrip = deleteduser.sub(/<<ROBOT:([0-9]*)/, "")
			if user_id and ::User.find_by_id(user_id)
				comment.body[regex] = "" if comment.body[regex] # remove robot text
				comment.user.login = ::User.find_by_id(user_id).email
			elsif !::User.find_by_id(user_id) and deleteduser!= ""
				comment.user.login = deletedstrip
				comment.body[regex] = "" if comment.body[regex] 
			# else
			# 	comment.body[regex] = "" if comment.body[regex] # remove robot text
			# 	comment.user.login = "User"
			end
		
		# 		 if user_id
		# 		comment.body[regex] = "" if comment.body[regex] # remove robot text
		# 		comment.user.login = ::User.find_by_id(user_id).email
		# end
		end
		comments
	end
end