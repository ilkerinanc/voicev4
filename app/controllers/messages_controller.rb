class MessagesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    
    @message = Message.new(params[:message])
    @message.sender_id = current_user.id
    @message.save
  end

  def destroy
  end
end
