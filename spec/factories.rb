FactoryGirl.define do

	sequence :project_name do |n|
		"Test Project #{n}"
	end

	sequence :email do |n|
		"user#{n}@example.com"
	end

	sequence :org_id do |n|
		n*1000
	end

	factory :organization do
		name "Some Organization"
		org_id 
	end

	factory :user do
		email
		password "password"
		registration_org_id { FactoryGirl.create(:organization).org_id }
	end	

	factory :project do 
		name FactoryGirl.generate(:project_name)
		description "Lorem ipsum"
		repo "thoughtbot/factory_girl"
		url "http://www.winduppixel.com"
		retainer_hours 5
	end

	factory :assignment do
		project
		user
	end

end