class CreateUserMeetUps < ActiveRecord::Migration[5.2]
  def change
    create_table :user_meet_ups do |t|
      t.integer :user_id
      t.integer :meet_up_id

      t.timestamps
    end
  end
end
