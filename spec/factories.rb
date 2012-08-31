FactoryGirl.define do
	factory :organization do
		name "Some Organization"
		org_id "1234"
	end

	factory :user do
		email "user@example.com"
		password "password"
		password_confirmation "password"
		registration_org_id 1234
	end	
end