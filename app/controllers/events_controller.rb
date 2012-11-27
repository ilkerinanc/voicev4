class EventsController < ApplicationController
  def index
	@events = Event.all
	@myEvents = Event.where(:creator_id => current_user.id)
  end

  def new
	@event = Event.new
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to event_path(:event => @event.id), :notice => "Event has been updated."
    else
      render :action => 'edit'
    end
  end

  def create
	@event = Event.new(params[:event])
    	@event.creator_id = current_user.id
    	@event.in_trash = false
    	if @event.save
     	 redirect_to events_url, :notice => "Successfully created event."
   	 else
   	   render :action => 'new'
	 end
  	end
  end

  def show
	@event = Event.find(params[:id])
  end

  def destroy
	Event.find(params[:event]).destroy
    	redirect_to events_url, :notice => "Event successfully deleted."
  end

  def edit
	@event = Event.find(params[:id])
  end
