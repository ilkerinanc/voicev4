class SubscriptionEventsController < ApplicationController
  def create
    @subscription_event = current_user.subscription_events.build(:event_id => params[:event_id])
    if @subscription_event.save
      redirect_to :back, :notice => "Successfully joined!"
    else
      render :action => 'new'
    end
  end

  def destroy
    @subscription_event = current_user.subscription_events.find_by_event_id(params[:event_id])
    @subscription_event.destroy
    redirect_to :back, :notice => "Successfully unsubscribed."
  end
end
