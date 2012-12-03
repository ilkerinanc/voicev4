class OccasionsController < ApplicationController
  def index
  	@occasions = Occasion.where('time > ?', Date.today - 1.days).order('created_at DESC') #gecmis occasion degil ise
  end

  def new
  	@occasion = Occasion.new
  end

  def create
    @occasion = Occasion.new
    #parse the time string (hh:mm)
    if (params[:day] == "today")
      @occasion.time = (Date.today + params[:occasion][:time][0..1].to_i.hour + params[:occasion][:time][3..4].to_i.minute)
    else
      @occasion.time = (Date.tomorrow + params[:occasion][:time][0..1].to_i.hour + params[:occasion][:time][3..4].to_i.minute)
    end

    if (@occasion.time > DateTime.now)
      @occasion.name = params[:occasion][:name]
      @occasion.description = params[:occasion][:description]
      @occasion.in_trash = false
      @occasion.creator_id = current_user.id
      if @occasion.save
        redirect_to occasions_url, :notice => "Successfully created occasion."
      else
        render :action => 'new'
      end
    else
      redirect_to new_occasion_url, :notice => "Please enter a valid time."
    end
  end

  def update
    @occasion = Occasion.find(params[:id])
    if @occasion.update_attributes(params[:occasion])
      redirect_to occasion_path(:occasion => @occasion.id), :notice => "Occasion has been updated."
    else
      render :action => 'edit'
    end
  end



  def destroy
    @occasion = Occasion.find(params[:occasion_id])
    @occasion.destroy
    redirect_to occasions_url, :notice => "Successfully destroyed occasion."
  end

  def missed
    @occasions = Occasion.where('time < ?', Date.today - 1.days) #gecmis ise   
  end

  def show
    @occasion = Occasion.find(params[:id])
  end

  

end
