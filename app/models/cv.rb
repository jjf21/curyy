# frozen_string_literal: true

class Cv < ApplicationRecord
  belongs_to :user
  belongs_to :theme

  before_save :remove_body_bg, if: :will_save_change_to_body_bg_pattern?
  before_save :remove_body_bg_pattern, if: :will_save_change_to_body_bg?
  before_create :set_theme_default_values

  def remove_body_bg
    return if body_bg_pattern.blank?

    self.body_bg = nil
  end

  def remove_body_bg_pattern
    return if body_bg.blank?

    self.body_bg_pattern = nil
  end

  def set_theme_default_values
    theme = Theme.find(theme_id)
    self.body_bg = theme.body_bg
    self.main_color = theme.main_color
    self.text_color = theme.text_color
    # self.font_family = theme.font_family
    self.header_bg = theme.header_bg
    # self.font_size = theme.font_size
  end
end
