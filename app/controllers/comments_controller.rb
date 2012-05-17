class CommentsController < ApplicationController
	respond_to :html, :js

	load_and_authorize_resource :project
	
	before_filter :find_topic

	def create
		@comment = Comment.new(params[:comment])
		@comment.user = current_user
		@comment.topic = @topic
		
		if @comment.save
      flash[:notice] = 'Comment posted'
    else
      error = I18n.t 'activerecord.errors.template.body'
      error += "<ul>"
      error += @comment.errors.full_messages.map { |error| "<li>" + error + "</li>"}.join("")
      error += "</ul>"
      flash[:error] = error.html_safe
    end

		redirect_to :back
	end

	private

	def find_topic
		@topic = Topic.find(params[:topic_id])
	end
end
