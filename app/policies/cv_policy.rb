# frozen_string_literal: true

class CvPolicy < ApplicationPolicy

  def export?
    user_record?
  end

  def test_export?
    user_record?
  end
end
