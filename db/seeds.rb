# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


n          = Time.new
day        = n.day
start_min  = 0
end_min    = 0
one_day    = 60*60*24

10.times do |i|

  start_hour = 9
  end_hour   = 10

  n += one_day
  input_date = Time.new(n.year, n.mon, n.day)

  10.times do |j|

    start_hour += 1
    end_hour   += 1
    start_date = Time.new(n.year, n.mon, n.day, start_hour, start_min)
    end_date   = Time.new(n.year, n.mon, n.day, end_hour, end_min)
    Timetable.create(datetime: input_date, starttime: start_date, endtime: end_date)
  end

end
