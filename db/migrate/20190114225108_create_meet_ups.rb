class CreateMeetUps < ActiveRecord::Migration[5.2]
  def change
    create_table :meet_ups do |t|
      t.string :name
      t.integer :location_id
      t.integer :meet_up_type_id
      t.datetime :date
      t.datetime :time

      t.timestamps
    end
  end
end
