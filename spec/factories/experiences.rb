# frozen_string_literal: true

# == Schema Information
#
# Table name: experiences
#
#  company     :string
#  created_at  :datetime         not null
#  current     :boolean          default(FALSE), not null
#  description :text
#  end_date    :date
#  id          :bigint           not null, primary key
#  item_type   :integer
#  location    :string
#  start_date  :date
#  title       :string
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_experiences_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :experience do
    user { create(:user) }
    start_date { "2020" }
    end_date { "2022" }
    current { false }
    title { "Experience 1" }
    description { "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." }
    company { "Quivron Web Solutions" }
    location { "Lille" }
    item_type { "work" }

    trait :work do
      title { "Developpeur" }
      company { "Quivron Web Solutions" }
      item_type { "work" }
    end

    trait :education do
      title { "Master IT" }
      company { "Iteem" }
      item_type { "education" }
    end
  end
end
