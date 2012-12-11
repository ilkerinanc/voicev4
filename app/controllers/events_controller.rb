# encoding: UTF-8
class EventsController < ApplicationController
  def index
	#@event = Event.new
  	@events = Event.all
  	@myEvents = Event.where(:creator_id => current_user.id)
    @user = current_user
  	@tempevents = Array.new
  	@tempinterests = @user.interests
  	@tempinterests.each do |i|
		if i.events.count > 0
			#@tempevents = @tempevents + i.events
			i.events.each do |e|
				unless @user.events.include?(e) 
          unless @tempevents.include?(e)
						@tempevents.push(e)
					end
				end
			end
		end
	end
    	@newevents = @tempevents
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
    ####################
    # @event = Event.new(params[:event])
    # :interest_tokens
    #@event = Event.new
    #@event.description = params[:event][:description]
    #@event.place = params[:event][:place]
    #@event.title = params[:event][:title]
    #@event.time =  Date.parse('2012-11-23') + params[:event][:time][0..1].to_i.hour + params[:event][:time][3..4].to_i.minute
    #@event.time =  Date.parse(params[:time]) + params[:event][:time][0..1].to_i.hour + params[:event][:time][3..4].to_i.minute
		@event = Event.new(params[:event])
    @event.creator_id = current_user.id
    @event.in_trash = false
	
    if @event.save
      UserActivity.create(
        :user_id => current_user.id,
        :klass => "Event",
        :klass_id => @event.id,
        :action => "created event"
        )

    	@event.interests.each do |i|
    	InterestActivity.create(
    		:user_id => current_user.id,
     	 	:interest_id => i.id,
   	   	:klass => "Event",
 	     	:klass_id => @event.id,
     	 	:action => "created event"
  	    )
    	end

    	redirect_to events_url, :notice => "Event was successfully created."
   	else
			
    	flash[:error] = " " << @event.errors.full_messages.join("...  ")

   	  render :action => 'new'
    end
  end

  def show
		@event = Event.find(params[:id])
  end

  def destroy
    Event.find(params[:event]).destroy
    redirect_to events_url, :notice => "Event was successfully deleted."
  end

  def edit
    @event = Event.find(params[:id])
		redirect_to events_url, :notice => "Event was successfully updated."
  end

end
