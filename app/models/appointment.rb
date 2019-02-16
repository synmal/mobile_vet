class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  validates :description, :appointment_date, :location, presence: true
end
