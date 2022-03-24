# == Schema Information
#
# Table name: users
#
#  about                  :string
#  address                :string
#  birthdate              :date
#  created_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  headline               :string
#  id                     :bigint           not null, primary key
#  interests              :text
#  last_name              :string
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  updated_at             :datetime         not null
#  website                :string
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
FactoryBot.define do
  factory :user do
    
  end
end
