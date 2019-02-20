class Game < ApplicationRecord
  has_many :user_games
  has_many :game_captions
end
