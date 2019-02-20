class CaptionSerializer < ActiveModel::Serializer
  has_many :game_captions
  has_many :games, through: :game_captions
  belongs_to :user
  attributes :id, :text, :user_id
end
