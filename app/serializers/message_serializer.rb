class MessageSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :chatroom_id, :content
end
