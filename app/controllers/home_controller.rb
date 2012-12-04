class HomeController < ApplicationController
  def index
  	if logged_in?
  		@activities = UserActivity.where(:user_id => [current_user.friends.collect(&:id)]+ [current_user.id] ).order("created_at DESC")
  	end
  	@occasions = Occasion.last(5)
  	@interests = Interest.last(5)
  	@events = Event.last(5)
  	@surveys = Survey.last(5)
  	@discussions = Discussion.last(5)
  	@users = User.last(5)
  end
end
