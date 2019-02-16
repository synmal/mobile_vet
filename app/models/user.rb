class User < ApplicationRecord
  has_many :pets
  has_many :appointments
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, :address, presence: true
  enum roles: [:doctor, :user, :admin]
end
