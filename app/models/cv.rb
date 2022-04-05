class Cv < ApplicationRecord
  belongs_to :user
  belongs_to :theme

  before_save :remove_body_bg, if: :will_save_change_to_body_bg_pattern?
  before_save :remove_body_bg_pattern, if: :will_save_change_to_body_bg?

  def remove_body_bg
    self.body_bg = nil
  end

  def remove_body_bg_pattern
    self.body_bg_pattern = nil
  end
end
