class Caption < ApplicationRecord
  belongs_to :user
  has_many :game_captions
  has_many :games, through: :game_captions
end
