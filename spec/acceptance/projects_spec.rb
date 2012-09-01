require 'acceptance/acceptance_helper'

feature 'Projects', %q{
  In order to better manage my projects
  As a normal user
  I want to work with them
} do

	background do
		normal_user_login # sets @user and @org
	end

	scenario 'visiting the projects root with no projects' do
		visit homepage 
		page.should have_content("have no projects.")
		# screen_shot_and_open_image
	end	

	scenario 'visiting the projects root with one project' do
		@user.should be_a(User)
		project = FactoryGirl.create(:project)
		FactoryGirl.create(:assignment, user: @user, project: project)
		visit homepage 
		page.should have_content(project.name)
		page.should have_content(project.description)
		# screen_shot_and_open_image
	end

	scenario 'visiting the projects root with many projects' do
		@user.should be_a(User)
		projects = []
		num_of_projects = 5
		(0..num_of_projects).each do |n|
			projects << FactoryGirl.create(:project)
			FactoryGirl.create(:assignment, user: @user, project: projects.last)
		end
	
		visit homepage

		(0..num_of_projects).each do |n|
			page.should have_content(projects[n].name)
			page.should have_content(projects[n].description)
		end 

		# screen_shot_and_open_image
	end

end
