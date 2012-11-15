class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to_target_or_default root_url, :notice => "Logged in successfully."
    else
      flash.now[:alert] = "Invalid login or password."
      render :action => 'new'
    end
  end

  def create_with_fb
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    # redirect_to root_url
    redirect_to_target_or_default root_url, :notice => "Logged in successfully."
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "You have been logged out."
  end
end
