class Theme < ApplicationRecord
  has_many :cvs

  def to_json
    {
      body_bg: self.body_bg,
      main_color: self.main_color,
      text_color: self.text_color,
      # font_family: self.font_family,
      header_bg: self.header_bg,
      # body_bg_pattern: self.body_bg_pattern,
      # font_size: self.font_size,
    }.to_json
  end
end
