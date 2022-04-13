# frozen_string_literal: true

require "rails_helper"

RSpec.describe Skill, type: :model do
  let!(:user) { create(:user) }

  describe "self.new_template" do
    it "should return a new skill Skill" do
      obj = Skill.new_template(user, "skill")
      expect(obj.class).to be Skill
      expect(obj.id).to be_nil
      expect(obj.item_type).to eq "skill"
    end

    it "should return a new tool Skill" do
      obj = Skill.new_template(user, "tool")
      expect(obj.class).to be Skill
      expect(obj.id).to be_nil
      expect(obj.item_type).to eq "tool"
    end

    it "should return a new language Skill" do
      obj = Skill.new_template(user, "language")
      expect(obj.class).to be Skill
      expect(obj.id).to be_nil
      expect(obj.item_type).to eq "language"
    end
  end
end
