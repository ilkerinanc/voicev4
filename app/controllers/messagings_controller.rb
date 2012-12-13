class DiscussionPostsController < ApplicationController
  def create
	@discussion_post = DiscussionPost.new
  	@discussion_post.content = params[:content]
  	@discussion_post.user_id = current_user.id
  	@discussion_post.discussion_id = params[:id]
  	raise
  end

  def destroy
  end
end
