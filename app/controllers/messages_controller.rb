class MessagesController < ApplicationController

  def index 
    @messages = Message.all
    render json: @messages 
  end

  def show
    @message = Message.find(params[:id])
    render json: @message, status: :ok 
  end

  def create 
    @message = Message.new(message_params)
    if @message.save
      MessageChannel.broadcast_to(@message.chatroom, @message)
      render json: @message, status: :created 
    else
      render json: {error: 'Could not create message.'}, status: 422
    end
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy
  end

  private

  def message_params
    params.require(:message).permit(:user_id, :chatroom_id, :content)
  end

end