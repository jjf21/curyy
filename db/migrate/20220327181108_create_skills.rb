# frozen_string_literal: true

class CreateSkills < ActiveRecord::Migration[7.0]
  def change
    create_table :skills do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.integer :level
      t.string :certification
      t.integer :item_type

      t.timestamps
    end
  end
end
