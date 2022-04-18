# frozen_string_literal: true


FactoryBot.define do
  factory :experience do
    user { create(:user) }
    start_date { "2020" }
    end_date { "2022" }
    current { false }
    title { Faker::Job.title }
    description { "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." }
    company { Faker::Job.title }
    location { Faker::Address.city  }
    item_type { "work" }

    trait :work do
      title { Faker::Job.title }
      company { Faker::Job.title }
      item_type { "work" }
    end

    trait :education do
      title { Faker::Educator.degree }
      company { Faker::Educator.university }
      item_type { "education" }
    end
  end
end
