class HomeController < ApplicationController
  def index
  	@activities = UserActivity.where(:user_id => [current_user.friends.collect(&:id)]+ [current_user.id] )
  	@occasions = Occasion.last(5)
  end
end
