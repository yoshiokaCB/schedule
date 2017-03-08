class CreateTimetableProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :timetable_properties do |t|
      t.integer :timetable_id
      t.integer :upper_limit

      t.timestamps
    end
  end
end
