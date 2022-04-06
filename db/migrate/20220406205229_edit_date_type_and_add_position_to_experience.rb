class EditDateTypeAndAddPositionToExperience < ActiveRecord::Migration[7.0]
  def change
    change_column :experiences, :start_date, :string
    change_column :experiences, :end_date, :string
    add_column :experiences, :position, :integer
  end
end
