class HomeController < ApplicationController
  def index
  	if logged_in?
  		@activities = UserActivity.where(:user_id => [current_user.friends.collect(&:id)]+ [current_user.id] ).order("created_at DESC")
  	end
  	@occasions = Occasion.last(5)
  end
end
