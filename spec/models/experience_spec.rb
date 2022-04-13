# frozen_string_literal: true

require "rails_helper"

RSpec.describe Experience, type: :model do
  let!(:user) { create(:user) }

  describe "self.new_template" do
    it "should return a new Work Experience" do
      obj = Experience.new_template(user, "work")
      expect(obj.class).to be Experience
      expect(obj.id).to be_nil
      expect(obj.item_type).to eq "work"
    end

    it "should return a new Education Experience" do
      obj = Experience.new_template(user, "education")
      expect(obj.class).to be Experience
      expect(obj.id).to be_nil
      expect(obj.item_type).to eq "education"
    end
  end
end
