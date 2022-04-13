# frozen_string_literal: true

u = User.find_by(email: "a@gmail.com") || User.create(email: "a@gmail.com", password: "bestxx", first_name: "Carl", last_name: "Quivron")

Experience.create(
  user: u,
  start_date: "mai 2020",
  end_date: "juin 2021",
  current: true,
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  company: "Choose Your Boss",
  location: "Lille",
  item_type: "work",
  title: "Developpeur web"
)
Experience.create(
  user: u,
  start_date: "sept 2018",
  end_date: "oct 2019",
  current: false,
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  company: "RDV Solidarité",
  location: "Paris",
  item_type: "work",
  title: "Developpeur web"
)
Experience.create(
  user: u,
  start_date: "2010",
  end_date: "2015",
  current: false,
  description: "Diplôme d'ingénieur de l'École centrale de Lille de Centrale Lille Institut",
  company: "Iteem",
  location: "Lille",
  item_type: "education",
  title: "Master"
)
Experience.create(
  user: u,
  start_date: "2015",
  end_date: "2019",
  current: false,
  description: "Le Wagon est une formation en développement web qui apprend aux étudiants à développer entièrement des applications web",
  company: "Le Wagon",
  location: "Lille",
  item_type: "education",
  title: "Formation Ruby on Rails"
)

theme = Theme.find_or_create_by!(name: "hello_world", body_bg: "#cfcfcf", main_color: "#eab308", text_color: "#2b315c", font_family: "Roboto")
theme = Theme.find_or_create_by!(name: "theme_2", body_bg: "#cfcfcf", main_color: "#eab308", text_color: "#2b315c", font_family: "Roboto")
Cv.create(theme:, user: u, body_bg: "#cfcfcf", main_color: "#eab308", text_color: "#2b315c", font_family: "Roboto")
