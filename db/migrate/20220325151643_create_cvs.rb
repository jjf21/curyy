# frozen_string_literal: true

class CreateCvs < ActiveRecord::Migration[7.0]
  def change
    create_table :cvs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :theme, null: false, foreign_key: true
      t.string :background
      t.string :main_color
      t.string :text_color
      t.string :font_family

      t.timestamps
    end
  end
end
