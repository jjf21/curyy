# frozen_string_literal: true

require "rails_helper"

RSpec.describe Theme, type: :model do
  describe "self.default_theme" do
    let!(:theme) { create(:theme) }

    it "should return a Theme object" do
      Theme.default_theme
      expect(Theme.default_theme.class).to be Theme
    end
  end
end
