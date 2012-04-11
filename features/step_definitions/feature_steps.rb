def create_user
	@user = FactoryGirl.create(:user, email: "test_user@example.com")
end

def log_in
	visit '/users/sign_in'
	fill_in 'Email', with: @user.email
	fill_in 'Password', with: 'password'
	click_button 'Sign in'
end

def create_project_with_access
	@project = FactoryGirl.create(:project)
	#maybe move this into the factory..
	@project.labels << Label.new(name: "Test Label", color: "333333", enabled: true)
	@project.user_ids |= [@user.id]
end

Given /^I am logged in as a normal user$/ do
  create_user
  log_in
end

Given /^I have access to a project$/ do
	create_project_with_access
end

Given /^a topic exists$/ do
  # topic one should exist as WebMock, defined in env.rb
  visit project_topic_path(@project, '1')
  page.has_css?('div#topic').should == true
  save_and_open_page
end

Given /^I subscribe to that topic$/ do
  pending # express the regexp above with the code you wish you had
end

When /^a new comment is created for that topic$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should receive a new notification$/ do
  pending # express the regexp above with the code you wish you had
end
