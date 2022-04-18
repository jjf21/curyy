# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "email#{n}@gmail.com" }
    password { "password" }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name    }
    headline { Faker::Company.profession }
  end
end
