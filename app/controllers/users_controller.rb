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
    @user.fullname = "#{@user.name} #{@user.surname}"
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
    @connections = @user.friends
    @pending = @user.requested_friendships.collect {|f| f.user }
    @friendship_score = friendship_score
    @voice  = current_user.voices.build
    @voices = @user.voices.order("created_at DESC")
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
    @user = User.find(params[:user])
    @friends = User.find(params[:user]).friends
  end

  def events
    @user = User.find(params[:user])
    @events = User.find(params[:user]).events
  end

  def interests
    @user = User.find(params[:user])
    @interests = User.find(params[:user]).interests
  end

  def message_receiver_index
    # @receivers = current_user.friends.order(:username).where("name like ?", "%#{params[:term]}%")
    @receivers = current_user.friends
    render :json => @receivers.map(&:username)
  end

  def settings
    @user = User.find(params[:user])
  end

  private

  def friendship_score
    f_ratio = (current_user.friends_in_common(@user).count.to_f / current_user.friends.count.to_f) * 10
    i_ratio = (current_user.interests_in_common(@user).count.to_f / current_user.interests.count.to_f) * 10
    (f_ratio + i_ratio) / 2
  end

end
