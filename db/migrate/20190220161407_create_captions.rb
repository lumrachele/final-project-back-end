class CreateCaptions < ActiveRecord::Migration[5.2]
  def change
    create_table :captions do |t|
      t.string :text
      t.integer :user_id

      t.timestamps
    end
  end
end
