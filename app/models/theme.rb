# frozen_string_literal: true

class Theme < ApplicationRecord
  has_many :cvs, dependent: :restrict_with_error

  def self.default_theme
    Theme.first
  end

  def self.name_with_avatar
    ["theme_2"]
  end

  def to_json(*_args)
    {
      body_bg:,
      main_color:,
      text_color:,
      # font_family: self.font_family,
      header_bg:,
      # body_bg_pattern: self.body_bg_pattern,
      # font_size: self.font_size,
    }.to_json
  end
end
