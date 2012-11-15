class RecommendationsController < ApplicationController
  def index
  	@interest_recommends = current_user.recommended_interests.first(5)
  	@user_recommends = current_user.recommended_users.first(5).reject {|u| u == current_user}
  end
end
