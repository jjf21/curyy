class EditThemeAndCvAttribute < ActiveRecord::Migration[7.0]
  def change
    rename_column :cvs, :background, :body_bg
    add_column :cvs, :header_bg, :string
    add_column :cvs, :body_bg_pattern, :string
    add_column :cvs, :font_size, :string

    rename_column :themes, :background, :body_bg
    add_column :themes, :header_bg, :string
    add_column :themes, :body_bg_pattern, :string
    add_column :themes, :font_size, :string

  end
end
