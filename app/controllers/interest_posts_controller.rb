class InterestPostsController < ApplicationController
  def create
  	# @interest_post = InterestPost.new
  	# @interest_post.content = params[:content]
  	# @interest_post.user_id = current_user.id
  	# @interest_post.interest_id = params[:id]
  	# raise
  	# puts params
  	@interest_post = InterestPost.new(params[:interest_post])
    @interest_post.user_id = current_user.id
    if @interest_post.save
       UserActivity.create(
          :user_id => current_user.id,
          :klass => "Interest",
          :klass_id => params[:interest_post][:interest_id],
          :action => "posted \"#{@interest_post.content}\" in interest"
          )
      redirect_to interest_path(params[:interest_post][:interest_id]), :notice => "Successfully posted to the wall!"
    else
      render :action => 'new'
    end
  end

  def destroy
  end
end
