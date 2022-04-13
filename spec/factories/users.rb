FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password { "password" }
    first_name { "John" }
    last_name { "Snow" }
  end
end
