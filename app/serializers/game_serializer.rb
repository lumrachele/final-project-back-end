class GameSerializer < ActiveModel::Serializer
  has_many :user_games
  has_many :users, through: :user_games
  has_many :game_captions
  has_many :captions, through: :game_captions
  attributes :id, :isActive
  # attributes :id, :players

  # def players
  #   self.object.users
  # end
end
