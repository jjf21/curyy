# frozen_string_literal: true

class CvPolicy < ApplicationPolicy

  def export?
    user_record?
  end
end
