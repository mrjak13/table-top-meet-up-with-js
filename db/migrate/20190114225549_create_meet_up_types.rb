class CreateMeetUpTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :meet_up_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
