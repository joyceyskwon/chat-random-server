class ChatroomsController < ApplicationController

  def index 
    @chatrooms = Chatroom.all 
    render json: @chatrooms 
  end 

  def show
    @chatroom = Chatroom.find(params[:id])
    if @chatroom 
      render json: @chatroom.messages, status: :ok
    else
      render json: {errors: @chatroom.errors.full_messages}
    end
  end

  def create 
    @chatroom = Chatroom.find_or_create_by(chatroom_params)
    render json: @chatroom, status: :created
  end 

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy
  end 

  private 

  def chatroom_params
    params.require(:chatroom).permit(:subject)
  end 

end
