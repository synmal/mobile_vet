class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :pet
  validates :description, :appointment_date, :location, :time, presence: true
  enum status: [:pending, :accepted, :declined]
  include PgSearch
  pg_search_scope :search_appointment, :against => [:appointment_date, :description, :location], :associated_against => {
    :pet => [:name, :pet_type, :breed],
    :user => [:name]
  }
end
