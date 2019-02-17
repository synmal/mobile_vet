FactoryBot.define do
  factory :diagnosis do
    
  end
  factory :appointment do
    user { nil }
    pet { nil }
    description { "MyText" }
    appointment_date { "2019-02-16" }
    location { "MyString" }
  end
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