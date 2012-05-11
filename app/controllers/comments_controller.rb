class CommentsController < ApplicationController
	respond_to :html, :js

	load_and_authorize_resource :project

	# before_filter :auth_topic
	
	before_filter :find_topic

	def create
		# Make the comment...
		# user, repo = @project.repo.split('/')
		# @comment = Github::Comment.new({gh_user: user, gh_repo: repo, issue_id: params[:topic_id]})
		# @comment.body = params[:github_comment][:body]
		# @comment.body.insert(0, robot_string)

		@comment = Comment.new(params[:comment])
		@comment.user = current_user
		@comment.topic = @topic
		
		@comment.save
		
		redirect_to :back
		
	end

	private

	# def auth_topic
	# 	#why....
	# end

	# def robot_string
	# 	"<<ROBOT:#{current_user.id}  #{current_user.email}\n\n"
	# end
	def find_topic
		@topic = Topic.find(params[:topic_id])
	end
end
