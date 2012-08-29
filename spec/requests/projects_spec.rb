require 'spec_helper'

describe "Projects" do

	describe "GET /projects" do
		before(:all) do
			# TODO: Should be FactoryGirl
			u = User.new(email: 'user@example.com', password: 'password', registration_org_id: 872872872 )
			visit(new_user_session_path)
			
		end

		it "works!" do
	  		get projects_path
			response.status.should be(200)  
		end
	end
end
