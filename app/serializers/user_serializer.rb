class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :color, :is_online

  has_many :messages
end
