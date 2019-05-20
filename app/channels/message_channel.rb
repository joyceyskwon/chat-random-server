class MessageChannel < ApplicationCable::Channel
  
  # Finding unique chatroom and subscribing by its ID
  def subscribed
    @chatroom = Chatroom.find_by(id: params[:id])
    stream_for @chatroom
  end

  # Any cleanup needed when channel is unsubscribed
  def unsubscribed
    @chatroom = Chatroom.find(params[:id])
    @chatroom.unsubscribe()
  end

end