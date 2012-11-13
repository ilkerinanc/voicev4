class OccasionsController < ApplicationController
  def index
  	@occasions = Occasion.where(:time < Date.today)
  end

  def new
  	@occasion = Occasion.new
  end

  def create
  	@occasion = Occasion.new(params[:occasion])
    @occasion.in_trash = false
    @occasion.creator_id = current_user.id
    if @occasion.save
      redirect_to occasions_url, :notice => "Successfully created occasion."
    else
      render :action => 'new'
    end
  end

  def destroy
  end
end
