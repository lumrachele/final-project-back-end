class GameCaption < ApplicationRecord
  belongs_to :caption
  belongs_to :game
end
