class CreateThemes < ActiveRecord::Migration[7.0]
  def change
    create_table :themes do |t|
      t.string :name
      t.string :background
      t.string :main_color
      t.string :text_color
      t.string :font_family

      t.timestamps
    end
  end
end
