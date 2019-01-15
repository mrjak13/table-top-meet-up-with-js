class CreateUserGames < ActiveRecord::Migration[5.2]
  def change
    create_table :usergames do |t|
      t.integer :user_id
      t.integer :board_game_id

      t.timestamps
    end
  end
end
