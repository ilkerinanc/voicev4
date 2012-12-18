class DiscussionsController < ApplicationController
  def index
    @discussions = Discussion.all
  end

  def show
    @discussion = Discussion.find(params[:id])
  end

  def new
    @discussion = Discussion.new
    1.times do
      
      discussionpost= @discussion.discussionposts.build
      discussionpost.creator_id= current_user.id
    end
  end

  def create
    @discussion = Discussion.new(params[:discussion])
    if @discussion.save
      redirect_to @discussion, :notice => "Successfully created discussion."
    else
      render :action => 'new'
    end

  end

  def edit
    @discussion = Discussion.find(params[:id])
  end

  def update
    @discussion = Discussion.find(params[:id])
    if @discussion.update_attributes(params[:discussion])
      redirect_to @discussion, :notice  => "Successfully updated discussion."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @discussion = Discussion.find(params[:id])
    @discussion.destroy
    redirect_to discussions_url, :notice => "Successfully destroyed discussion."
  end
end
