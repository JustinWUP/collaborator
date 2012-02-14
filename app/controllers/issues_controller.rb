class IssuesController < ApplicationController
	before_filter :find_project
	before_filter :find_issue
	before_filter :find_comments

  def show
     
  end

  private 

  def find_project
  	@project = Project.find(params[:project_id])
    @issues = Octokit.issues(@project.repo)
  end

  def find_issue
  	@issue = Octokit.issue(@project.repo, params[:issue_id])	
  end

  def find_comments
  	@comments = Octokit.issue_comments(@project.repo, params[:issue_id])
  end


end
