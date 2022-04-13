FactoryBot.define do
  factory :cv do
    user { User.first || create(:user) }
    theme { Theme.first || create(:theme) }
    body_bg { "red" }
    header_bg { "blue" }
    main_color { "pink" }
    text_color { "black" }
    font_family { "MyString" }
  end
end
