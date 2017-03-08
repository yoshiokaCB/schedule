json.extract! timetable, :id, :datetime, :starttime, :endtime, :created_at, :updated_at
json.url timetable_url(timetable, format: :json)
