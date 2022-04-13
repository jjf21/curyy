require "rails_helper"

RSpec.describe Cv, type: :model do
  describe ".set_theme_default_values" do
    let!(:theme) { create(:theme, body_bg: "blue", main_color: "red", text_color: "pink", header_bg: "violet") }
    let!(:user) { create(:user) }

    it "verifies that defautl values are set" do
      expect(Cv.count).to eq 0
      cv = Cv.new(user:, theme:)
      cv.save(validate: false)
      expect(Cv.count).to eq 1
      expect(cv.body_bg).to eq "blue"
      expect(cv.main_color).to eq "red"
      expect(cv.text_color).to eq "pink"
      # expect(cv.font_family).not_to be_empty
      expect(cv.header_bg).to eq "violet"
      # expect(cv.body_bg_pattern).not_to be_empty
      # expect(cv.font_size).not_to be_empty
    end
  end

  describe ".remove_body_bg" do
    let(:theme) { create(:theme, body_bg: nil, body_bg_pattern: nil) }
    let!(:cv) { create(:cv, theme:) }

    it "should be call when changes to body_bg_pattern are made" do
      expect(cv).to receive(:remove_body_bg)
      cv.update(body_bg_pattern: "red")
    end

    it "should not be call when no changes to body_bg_pattern are made" do
      expect(cv).not_to receive(:remove_body_bg)
      cv.update(body_bg: "red", main_color: "blue", text_color: "yellow", header_bg: "pink")
    end

    it "should empty body_bg value" do
      cv.update(body_bg_pattern: "red")
      expect(cv.body_bg).to be_nil
    end
  end

  describe ".remove_body_bg_pattern" do
    let(:theme) { create(:theme, body_bg: nil, body_bg_pattern: nil) }
    let!(:cv) { create(:cv, theme:) }

    it "should be call when changes to body_bg are made" do
      expect(cv).to receive(:remove_body_bg_pattern)
      cv.update(body_bg: "yellow")
    end

    it "should not be call when no changes to body_bg are made" do
      expect(cv).not_to receive(:remove_body_bg_pattern)
      cv.update(body_bg_pattern: "red", main_color: "blue", text_color: "yellow", header_bg: "pink")
    end

    it "should empty body_bg_pattern value" do
      cv.update(body_bg: "red")
      expect(cv.body_bg_pattern).to be_nil
    end
  end
end
