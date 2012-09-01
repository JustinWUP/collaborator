module HelperMethods
  
  def normal_user_login  
    @user = FactoryGirl.create(:user) 
  
    ## Don't want to test the login integration here.. just want to log in
    login_as @user

    ## So none of this.
    # user_attr = FactoryGirl.attributes_for(:user) 
    # visit "/users/sign_in"
    # fill_in "Email", with: user.email
    # fill_in "Password", with: user_attr[:password]
    # click_button "Sign in"
    # page.should_not have_content("Invalid email or password")
  end

end

RSpec.configuration.include HelperMethods, :type => :acceptance