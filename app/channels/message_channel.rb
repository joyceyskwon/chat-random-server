class MessageChannel < ApplicationCable::Channel
  
  # Finding unique chatroom and subscribing by its ID
  def subscribed
    stream_for Chatroom.find_by(id: params[:id])
  end
    
  def unsubscribed
    @chatroom = Chatroom.find(params[:id])
    @chatroom.unsubscribe()
  end

end