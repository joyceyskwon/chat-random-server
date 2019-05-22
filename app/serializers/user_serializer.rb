class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :color, :is_online
end
