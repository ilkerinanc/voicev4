class FriendshipsController < ApplicationController
  
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id], :approved => false)
    if @friendship.save
      redirect_to user_show_path(:user => current_user.id), :notice => "Connect request sent to #{User.find(params[:friend_id]).name} #{User.find(params[:friend_id]).surname}!"
    else
      render :action => 'new'
    end
  end

  def destroy
    @friendship = Friendship.find(params[:friendship_id])
    # Recommendable methods begin
    if @friendship.approved?
      if current_user.id == @friendship.user.id
        current_user.unlike(@friendship.friend)
        @friendship.friend.unlike(current_user)
      else
        current_user.unlike(@friendship.user)
        @friendship.user.unlike(current_user)
      end
    end
    # Recommendable methods end

    @friendship.destroy
    redirect_to user_show_path(:user => current_user), :notice => "Successfully destroyed connection."
  end

  def approve
    @friendship = Friendship.find(params[:friendship_id])
    @friendship.approved = true
    if @friendship.save
      # Recommendable methods begin
      current_user.like(@friendship.user)
      @friendship.user.like(current_user)
      # Recommendable methods end
      redirect_to user_show_path(:user => current_user), :notice => "Connection approved!"
    end
  end

  def ignore
  end
end
