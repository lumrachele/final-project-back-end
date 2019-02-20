class GameCaptionSerializer < ActiveModel::Serializer
  belongs_to :game
  belongs_to :caption
  attributes :id, :caption_id, :game_id, :points
end
