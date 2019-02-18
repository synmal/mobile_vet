# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User
# user = {}
# user['password'] = 'seed@1234'

# ActiveRecord::Base.transaction do
#   200.times do
#     user['name'] = Faker::Name.unique.name
#     user['address'] = Faker::Address.full_address
#     user['phone'] = Faker::PhoneNumber.cell_phone
#     user['email'] = user['name'].delete(' ') + '@example.com'
#     User.create(user)
#   end
# end

# pet = {}
# ActiveRecord::Base.transaction do
#   User.where(roles: 'user').each do |user|
#     no_of_pets = [1,2,3,4,5,6,7,8,9,10].sample
#     no_of_pets.times do
#       pet['name'] = Faker::Creature::Dog.name
#       pet['age'] = Faker::Number.within(1..10)
#       pet['pet_type'] = 'Dog'
#       pet['breed'] = Faker::Creature::Dog.breed
#       pet['user_id'] = user.id
#       Pet.create(pet)
#     end
#   end
# end

# appointment = {}
# hour = (8..16).to_a
# minute = [0, 30]

# ActiveRecord::Base.transaction do
#   User.where(roles: 'user').each do |user|
#     appointment['user_id'] = user.id
#     appointment['pet_id'] = user.pets.sample.id
#     appointment['description'] = Faker::Lorem.paragraph(3)
#     appointment['appointment_date'] = Faker::Date.forward(100)
#     appointment['location'] = user.address
#     appointment['time'] = Time.new(2000, 1, 1, hour.sample, minute.sample, 0)
#     appointment['status'] = Faker::Number.between(1, 2)
#     Appointment.create(appointment)
#   end
# end