class AddGameIdToMeetUps < ActiveRecord::Migration[5.2]
  def change
    add_column :meet_ups, :game_id, :integer
  end
end
