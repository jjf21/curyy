# frozen_string_literal: true

FactoryBot.define do
  factory :skill do
    user { create(:user) | User.first }
    name { "Ruby On Rails" }
    level { 5 }
    certification { "" }
    item_type { "skill" }

    trait :tool do
      item_type { "tool" }
    end

    trait :language do
      item_type { "language" }
    end
  end
end
