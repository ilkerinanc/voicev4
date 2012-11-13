class UsersController < ApplicationController
  before_filter :login_required, :except => [:new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Thank you for signing up! You are now logged in."
    else
      render :action => 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice => "Your profile has been updated."
    else
      render :action => 'edit'
    end
  end

  def show
    @user = User.find(params[:user])
  end

  def contact
    @user = User.find(params[:user])
  end

  def about
    @user = User.find(params[:user])
  end

  # to show friend request pending approval from the user.
  def pending
    @user = current_user
    @friendship_requests = current_user.requested_friendships
  end

  def connections
    @user = current_user
    @friends = User.find(params[:user]).friends
  end

  def interests
    @user = current_user
    @interests = current_user.interests
  end

end
