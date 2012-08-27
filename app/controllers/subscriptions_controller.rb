class SubscriptionsController < ApplicationController
  # Load first.. 
  load_and_authorize_resource
  # ..then filter  
  before_filter :filter_index, :only => :index
  before_filter :find_subscription, :except => [:index]

  def togglemodify
    if !@subscription.enabled?
      @subscription.destroy
       flash[:notice] = 'You have unsubscribed from ' + @subscription.subscribable.title
      
       @subscription.save
    else
          @subscription.save
    end
  end

  def toggle
      @subscription.enabled = @subscription.enabled? ? false : true
      # @subscription.save
      togglemodify
      redirect_to :back
  end


  def destroy
    @subscription.destroy
    flash[:notice] = 'You have unsubscribed from ' + @subscription.subscribable.title
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
