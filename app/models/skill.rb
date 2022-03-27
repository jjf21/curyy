class Skill < ApplicationRecord
  enum item_type: { language: 0, tool: 1, skill: 2 }

  belongs_to :user
end
