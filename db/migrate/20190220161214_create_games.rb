class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.boolean :isActive? :default=> true
      t.timestamps

    end
  end
end
