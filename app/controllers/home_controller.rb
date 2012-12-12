class HomeController < ApplicationController
  def index
  	if logged_in?
  		@activities = UserActivity.where(:user_id => [current_user.friends.collect(&:id)]+ [current_user.id] ).order("created_at DESC")
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
      @newevents = @tempevents.last(5)

      @occasions = Occasion.last(5)
      @interests = Interest.last(5)
      @events = Event.last(5)
      @surveys = Survey.last(5)
      #@discussions = Discussion.last(5)
      @users = User.last(5)  
    end
  	

  end
end