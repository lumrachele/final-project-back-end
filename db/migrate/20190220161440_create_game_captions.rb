class CreateGameCaptions < ActiveRecord::Migration[5.2]
  def change
    create_table :game_captions do |t|
      t.integer :caption_id
      t.integer :game_id
      t.integer :points, :default => 0

      t.timestamps
    end
  end
end
