class EventInterestsController < ApplicationController
  def create
	@event_interest = @event.event_interests.build(:interest_id => params[:interest_id])
	if @event_interest.save
		redirect_to :back, :notice => "Successfully subscribed!"
	else
		render :action => 'new'
  	end
  end

  def destroy
	@event_interest = @event.event_interests.find_by_interest_id(params[:interest_id])
	@event_interest.destroy
    	redirect_to :back, :notice => "Successfully unsubscribed."
  end
end