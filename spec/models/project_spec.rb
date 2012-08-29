require 'spec_helper'

describe Project do
	it "can be instantiated" do
		Project.new.should be_an_instance_of(Project) 
	end
end
