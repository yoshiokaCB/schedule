class CreateTimetableUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :timetable_users do |t|
      t.integer :user_id
      t.integer :timetable_id
      t.text :notice
      t.string :program_name

      t.timestamps
    end
  end
end
