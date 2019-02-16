FactoryBot.define do
  factory :user do
    name { "John Smith" }
    address { "1" }
    email { "johnsmith@example.com" }
    password { "123" }
    roles { 'user' }
  end

  factory :pet do
    user
    name { "jojo" }
    pet_type { "cat" }
  end
end