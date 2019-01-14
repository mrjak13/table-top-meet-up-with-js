class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :min_players
      t.integer :max_players
      t.string :description
      t.string :play_time
      t.boolean :mature_content

      t.timestamps
    end
  end
end
