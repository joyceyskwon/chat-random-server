class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages 

  validates :subject, presence: true, uniqueness: true
end
