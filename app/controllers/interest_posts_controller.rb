class InterestPostsController < ApplicationController
  def create
  	@interest_post = InterestPost.new
  	@interest_post.content = params[:content]
  	@interest_post.user_id = current_user.id
  	@interest_post.interest_id = params[:id]
  	raise
  end

  def destroy
  end
end
