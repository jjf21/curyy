# frozen_string_literal: true

Theme.find_or_create_by!(
  name: "hello_world",
  body_bg: "#e9e6e3",
  header_bg: "#354756",
  main_color: "#cfb482",
  text_color: "#354856", 
)
Theme.find_or_create_by!(
  name: "theme_2",
  body_bg: "#f5f5f5",
  header_bg: "#f5f5f5",
  main_color: "#282c2d",
  text_color: "#282c2d",
)
