class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :name, :address, presence: true
  enum roles: [:user, :doctor, :admin]
  has_secure_password
end
