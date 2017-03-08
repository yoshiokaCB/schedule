class CreateTimetables < ActiveRecord::Migration[5.0]
  def change
    create_table :timetables do |t|
      t.datetime :datetime
      t.datetime :starttime
      t.datetime :endtime

      t.timestamps
    end
  end
end
