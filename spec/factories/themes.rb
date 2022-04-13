FactoryBot.define do
  factory :theme do
    name { "hello_world" }
    body_bg { "#fff" }
    header_bg { "blue" }
    main_color { "yellow" }
    text_color { "blue" }
    font_family { "" }
  end
end
