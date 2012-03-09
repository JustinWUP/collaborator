class CommentsController < ApplicationController
	respond_to :html, :js

	load_and_authorize_resource :project, :through => :current_user

	before_filter :auth_issue

	def create
		# Make the comment...
		@comment = Github::Comment.new

		respond_with @comment, location: project_issue_path(params[:project_id], params[:issue_id])
	end

	private

	def auth_issue
		
	end
end
