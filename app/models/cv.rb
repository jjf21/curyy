class Cv < ApplicationRecord
  belongs_to :user
  belongs_to :theme

  before_create :set_theme_default_values
  before_save :remove_body_bg, if: :will_save_change_to_body_bg_pattern?
  before_save :remove_body_bg_pattern, if: :will_save_change_to_body_bg?

  def remove_body_bg
    self.body_bg = nil
  end

  def remove_body_bg_pattern
    self.body_bg_pattern = nil
  end

  def set_theme_default_values
    theme = Theme.find(self.theme_id)
    self.body_bg = theme.body_bg
    self.main_color = theme.main_color
    self.text_color = theme.text_color
    # self.font_family = theme.font_family
    self.header_bg = theme.header_bg
    # self.font_size = theme.font_size
  end
end
