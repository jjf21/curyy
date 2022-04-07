class Experience < ApplicationRecord
  attr_accessor :newly_created

  enum item_type: { work: 0, education: 1 }

  acts_as_list scope: [:item_type]

  belongs_to :user

  default_scope { order(position: :asc) }

  def self.new_template(user, item_type)
    case item_type
    when 'work'
      Experience.new(
        user: user,
        item_type: item_type,
        start_date: "jan 2020",
        end_date: "aujourd'hui",
        description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
        company: "Entreprise",
        location: "Ville",
        title: "Nom du poste"
      )
    when 'education'
      Experience.new(
        user: user,
        item_type: item_type,
        start_date: "2010",
        end_date: "2015",
        description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
        company: "Nom de l'école",
        location: "Paris",
        title: "Diplome"
      )
    end
  end

  def newly_created!
    self.newly_created = true
  end

end
