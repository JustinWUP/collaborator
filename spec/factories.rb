FactoryGirl.define do 
	factory :organization do
		name "Test Organization"
		org_id 1234
	end

	factory :user do
		email "test_user@example.com"
		password "password"
		registration_org_id FactoryGirl.create(:organization).org_id
	end

	factory :project do 
		name "Test Project"
		repo "test/test"
		url "http://www.example.com/"
	end
end
