class RegistrationsController < Devise::RegistrationsController
before_filter :appname

private 
  def appname
    @appname = "ACCOUNTS"
  end
end