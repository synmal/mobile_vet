class Pet < ApplicationRecord
  validates :name, :pet_type, presence: true
  belongs_to :user
  has_many :appointments
end