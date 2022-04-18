# frozen_string_literal: true

FactoryBot.define do
  factory :theme do
    name { "hello_world" }
    body_bg { "#fff" }
    header_bg { "blue" }
    main_color { "yellow" }
    text_color { "blue" }

    trait :hello_world do
      name { "hello_world" }
      body_bg { "#e9e6e3" }
      header_bg { "#354756" }
      main_color { "#cfb482" }
      text_color { "#282c2d" }
    end

    trait :hello_world do
      name { "hello_world" }
      body_bg { "#f5f5f5" }
      header_bg { "#f5f5f5" }
      main_color { "#282c2d" }
      text_color { "#282c2d" }
    end
  end
end
