class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.boolean :isHost, :default=> false

      t.timestamps
    end
  end
end
