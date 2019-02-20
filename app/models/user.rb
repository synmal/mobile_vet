class User < ApplicationRecord
  has_many :pets
  has_many :appointments
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, :address, :phone, presence: true
  validates :password, length: { minimum: 8 }, on: :create
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  enum roles: [:doctor, :user, :admin]
  attr_encrypted :phone, key: ENV['SECRET_KEY']
end
