class SubscriptionsController < ApplicationController
  def create
  	@subscription = current_user.subscriptions.build(:interest_id => params[:interest_id])
    if @subscription.save
      # Recommendable methods begin
      # current_user.like(@subscription.interest)
      # Recommendable methods end
      redirect_to :back, :notice => "Successfully subscribed!"
    else
      render :action => 'new'
    end
  end

  def destroy
  	@subscription = current_user.subscriptions.find_by_interest_id(params[:interest_id])
    # Recommendable methods begin
    # current_user.unlike(@subscription.interest)
    # Recommendable methods end
    @subscription.destroy
    redirect_to :back, :notice => "Successfully unsubscribed."
  end
end