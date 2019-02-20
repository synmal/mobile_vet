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

  def self.status(status)
    self.where(status: status).order(created_at: :DESC)
  end

  def self.upcoming
    self.where(status: 'accepted', appointment_date: Date.today).order(created_at: :DESC)
  end

end
