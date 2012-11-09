class InterestsController < ApplicationController
  def index
    @interests = Interest.all
  end

  def new
    @interest = Interest.new
  end

  def create
    @interest = Interest.new(params[:interest])
    @interest.in_trash = false
    @interest.creator_id = current_user.id
    if @interest.save
      redirect_to interests_url, :notice => "Successfully created interest."
    else
      render :action => 'new'
    end
  end

  def destroy
    @interest = Interest.find(params[:interest_id])
    @interest.destroy
    redirect_to interests_url, :notice => "Successfully destroyed interest."
  end

  def show
    @interest = Interest.find(params[:id])
  end

  def edit
    @interest = Interest.find(params[:id])
  end
end
