class Pet < ApplicationRecord
  validates :name, :pet_type, presence: true
  belongs_to :user
end