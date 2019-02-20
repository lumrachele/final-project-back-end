class UserSerializer < ActiveModel::Serializer
  has_many :captions
  has_many :user_games
  has_many :games, through: :user_games
  attributes :id, :username, :isHost
end
