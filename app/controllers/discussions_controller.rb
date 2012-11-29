class DiscussionsController < ApplicationController
  def index
    @discussions = Discussion.all
  end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new(params[:discussion])
    @discussion.in_trash = false
    @discussion.creator_id = current_user.id
    if @discussion.save
      UserActivity.create(
          :user_id => current_user.id,
          :klass => "Discussion",
          :klass_id => @discussion.id,
          :action => "created discussion"
          )
      redirect_to interests_url, :notice => "Successfully created discussion."
    else
      render :action => 'new'
    end
  end

  def update
    @discussion = Discussion.find(params[:id])
    if @discussion.update_attributes(params[:discussion])
      redirect_to discussion_path(:discussion => @discussion.id), :notice => "Discussion has been updated."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @discussion = Discussion.find(params[:discussion_id])
    @discussion.destroy
    redirect_to discussions_url, :notice => "Successfully destroyed discussion."
  end

  def show
    @discussion = Discussion.find(params[:id])
  end

  def edit
    @discussion = Discussion.find(params[:id])
  end

end
