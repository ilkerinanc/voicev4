class OccasionsController < ApplicationController
  def index
  	@occasions = Occasion.where('time > ?', Date.today - 1.days) #gecmis occasion degil ise
  end

  def new
  	@occasion = Occasion.new
  end

  def create
  	@occasion = Occasion.new(params[:occasion])

    if (@occasion.time == Date.today) || (@occasion.time == Date.today+1.days) #improve check
      @occasion.in_trash = false
      @occasion.creator_id = current_user.id
      if @occasion.save
        redirect_to occasions_url, :notice => "Successfully created occasion."
      else
        render :action => 'new'
      end
    else
      redirect_to occasions_url, :notice => "Please enter a valid time."
    end
  end

  def destroy
  end

  def show
    @occasion = Occasion.find(params[:id])
  end

end
