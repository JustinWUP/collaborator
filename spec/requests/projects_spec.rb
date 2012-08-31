require 'spec_helper'

describe "Projects" do
 	before :all do
 		@org = FactoryGirl.create(:organization)
 		@user = FactoryGirl.create(:user)  
 	end

 	it "works with FactoryGirl" do 
 		@org.org_id.should be(1234)
 		@user.email.should eq("user@example.com")
 	end
end  