require 'spec_helper'

describe "apps/new" do
  before(:each) do
    assign(:app, stub_model(App,
      :title => "MyString",
      :description => "MyString",
      :image => "MyString"
    ).as_new_record)
  end

  it "renders new app form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => apps_path, :method => "post" do
      assert_select "input#app_title", :name => "app[title]"
      assert_select "input#app_description", :name => "app[description]"
      assert_select "input#app_image", :name => "app[image]"
    end
  end
end
