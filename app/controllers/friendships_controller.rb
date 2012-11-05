class FriendshipsController < ApplicationController
  
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id], :approved => false)
    if @friendship.save
      redirect_to root_url, :notice => "Connect request sent!"
    else
      render :action => 'new'
    end
  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    redirect_to root_url, :notice => "Successfully destroyed connection."
  end

  def approve
    @friendship = Friendship.find(params[:friendship_id])
    @friendship.approved = true
    if @friendship.save
      redirect_to user_pending_path, :notice => "Connection approved!"
    end
  end

  def ignore
  end
end
