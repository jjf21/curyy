if User.find_by(email: "a@gmail.com")
  u = User.find_by(email: "a@gmail.com")
else
  u = User.create(email: "a@gmail.com", password: "bestxx", first_name: "Carl", last_name: "Quivron")
end

Experience.create(
  user: u,
  start_date: Date.today,
  end_date: 10.months.ago,
  current: true,
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  company: "Choose Your Boss",
  location: "Lille",
  item_type: "work",
  title: "Developpeur web"
)
Experience.create(
  user: u,
  start_date: 12.months.ago,
  end_date: 20.months.ago,
  current: false,
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  company: "RDV Solidarité",
  location: "Paris",
  item_type: "work",
  title: "Developpeur web"
)
Experience.create(
  user: u,
  start_date: 5.years.ago,
  end_date: 10.years.ago,
  current: false,
  description: "exp description 2",
  company: "Kedge",
  location: "Bordeaux",
  item_type: "education",
  title: "Master"
)
Experience.create(
  user: u,
  start_date: 4.years.ago,
  end_date: 5.years.ago,
  current: false,
  description: "exp description 2",
  company: "Le Wagon",
  location: "Lille",
  item_type: "education",
  title: "Formation Ruby on Rails"
)
