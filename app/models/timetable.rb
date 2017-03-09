class Timetable < ApplicationRecord
  has_many :timetable_users, dependent: :destroy
  accepts_nested_attributes_for :timetable_users
end
