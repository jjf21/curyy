# frozen_string_literal: true

FactoryBot.define do
  factory :cv do
    user { User.first || create(:user) }
    theme { Theme.first || create(:theme) }
    body_bg { Faker::Color.hex_color }
    header_bg { Faker::Color.hex_color }
    main_color { Faker::Color.hex_color }
    text_color { Faker::Color.hex_color }
    font_family { "MyString" }
  end
end
