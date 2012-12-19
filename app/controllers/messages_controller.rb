class MessagesController < ApplicationController
  def index
    @conversation_users = User.find((Message.where(:receiver_id => current_user.id).collect(&:sender_id) + Message.where(:sender_id => current_user.id).collect(&:receiver_id)))
    @conversation_users.uniq!
  end

  def feed
    @message = Message.new(:receiver_id => params[:user])
    @messages = Message.where("(receiver_id = ? AND sender_id = ?) OR (sender_id = ? AND receiver_id = ?)", current_user.id, params[:user], current_user.id, params[:user]).order("created_at DESC")
    @conversation_user = User.find(params[:user])
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    @message.sender_id = current_user.id
    
    if @message.save
      redirect_to message_feed_path(:user => @message.receiver_id), :notice => "Your message has been sent!"
    else
      render :action => 'new'
    end
  end

  def destroy
  end
end
