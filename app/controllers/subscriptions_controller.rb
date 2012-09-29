class SubscriptionsController < ApplicationController
  # Load first.. 
  load_and_authorize_resource
  # ..then filter  
  before_filter :filter_index, :only => [:index, :show]
  before_filter :find_subscription, :except => [:index]

  def toggle
      @subscription.enabled = @subscription.enabled? ? false : true
      @subscription.save

      redirect_to :back
  end


  def unsub
      @subscription.enabled = @subscription.enabled? ? false : true
      @subscription.save
      if @subscription.user.email.to_s  != current_user.email
        flash[:notice] = @subscription.user.email.to_s + ' has been unsubscribed from ' + @subscription.subscribable.title
      else
        flash[:notice] = 'You have unsubscribed from ' + @subscription.subscribable.title
      end
      redirect_to subscriptions_path
  end

  def show
    @subscription = Subscription.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subscription}
    end
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
    #@subscriptions = Subscription.accessible_by(current_ability).select {|obj| obj.enabled == true}

    # HACK: Workaround for Topics without Projects
    #@subscriptions = @subscriptions.reject {|obj| obj.subscribable.project == nil}
  end
end
