class RemoveCurrentFromExperiences < ActiveRecord::Migration[7.0]
  def up
    remove_column :experiences, :current
  end
  def down
    add_column :experiences, :current, :boolean, default: false
  end
end
