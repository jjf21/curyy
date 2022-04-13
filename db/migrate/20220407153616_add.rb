# frozen_string_literal: true

class Add < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cv_email, :string
  end
end
