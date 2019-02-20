class Caption < ApplicationRecord
  belongs_to :user
  has_many :game_captions
end
