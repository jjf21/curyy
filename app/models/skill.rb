class Skill < ApplicationRecord
  attr_accessor :newly_created

  enum item_type: { language: 0, tool: 1, skill: 2 }

  belongs_to :user

  def self.new_template(user, item_type)
    case item_type
    when 'skill'
      Skill.new(
        user: user,
        item_type: item_type,
        name: "Compétence"
      )
    when 'tool'
      Skill.new(
        user: user,
        item_type: item_type,
        name: "Outil",
      )
    when 'language'
      Skill.new(
        user: user,
        item_type: item_type,
        name: "Francais",
        certification: "natif",
      )
    end
  end

  def newly_created!
    self.newly_created = true
  end
end
