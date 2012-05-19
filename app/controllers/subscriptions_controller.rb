class SubscriptionsController < ApplicationController
  # Load first.. 
  load_and_authorize_resource
  # ..then filter  
  before_filter :filter_index, :only => :index
  before_filter :find_subscription, :except => [:index]

  def toggle
      @subscription.enabled = @subscription.enabled? ? false : true
      @subscription.save

      redirect_to :back
  end

  private

  def find_subscription
    @subscription = Subscription.find(params[:id])
  end

  def filter_index
    @subscriptions = Subscription.accessible_by(current_ability)
  end
end
