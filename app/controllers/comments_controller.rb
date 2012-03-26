class CommentsController < ApplicationController
	respond_to :html, :js

	load_and_authorize_resource :project

	before_filter :auth_topic

	def create
		# Make the comment...
		user, repo = @project.repo.split('/')
		@comment = Github::Comment.new({gh_user: user, gh_repo: repo, issue_id: params[:topic_id]})
		@comment.body = params[:github_comment][:body]
		@comment.body.insert(0, robot_string)
		@comment.save

		respond_with @comment, location: project_topic_path(params[:project_id], params[:topic_id])
	end

	private

	def auth_topic
		#why....
	end

	def robot_string
		"<<ROBOT:#{current_user.id}  #{current_user.email}\n\n"
	end
end
