class VoicesController < ApplicationController
  def new
    @voice = Voice.new
  end

  def create
    @voice = Voice.new(params[:voice])
    @voice.user_id = current_user.id
    if @voice.save
      redirect_to user_show_path(:user => current_user), :notice => "Successfully created voice."
    else
      render :action => 'new'
    end
  end

  def destroy
    @voice = Voice.find(params[:id])
    @voice.destroy
    redirect_to root_url, :notice => "Successfully destroyed voice."
  end
end
