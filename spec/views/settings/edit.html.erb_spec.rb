require 'spec_helper'

describe "settings/edit" do
  before(:each) do
    @setting = assign(:setting, stub_model(Setting,
      :key => "MyString",
      :value => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit setting form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => settings_path(@setting), :method => "post" do
      assert_select "input#setting_key", :name => "setting[key]"
      assert_select "input#setting_value", :name => "setting[value]"
      assert_select "textarea#setting_description", :name => "setting[description]"
    end
  end
end
