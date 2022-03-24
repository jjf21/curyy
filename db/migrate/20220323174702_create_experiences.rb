class CreateExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :experiences do |t|
      t.references :user, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.boolean :current, null: false, default: false
      t.string :title
      t.text :description
      t.string :company
      t.string :location
      t.integer :item_type

      t.timestamps
    end
  end
end
