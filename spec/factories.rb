FactoryBot.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :appointment do
    user
    pet
    description { "MyText" }
    appointment_date { Date.today }
    location { "MyString" }
    time { Time.now }
  end

  factory :user do
    name { "John Smith" }
    address { "1" }
    email { generate :email }
    password { "this@is@a@stong@password" }
    phone { "1234567890" }
  end

  factory :pet do
    user
    name { "Chico" }
    pet_type { "Dog" }
    breed { "German Shephard" }
    age { 3 }
  end
end