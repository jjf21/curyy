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
    user { nil }
    start_date { "2022-03-23" }
    end_date { "2022-03-23" }
    current { false }
    title { "MyString" }
    description { "MyText" }
    company { "MyString" }
    location { "MyString" }
    item_type { "" }
  end
end
