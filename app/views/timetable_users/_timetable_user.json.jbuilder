json.extract! timetable_user, :id, :user_id, :timetable_id, :notice, :program_name, :created_at, :updated_at
json.url timetable_user_url(timetable_user, format: :json)
