require "rails_helper"

RSpec.describe User, type: :model do
  let!(:user) { create(:user, email: "email@gmail.com", first_name: "John", last_name: "Smith") }
  describe ".full_name" do
    it "display full_name" do
      expect(user.full_name).to eq "John Smith"
      user.update(first_name: nil, last_name: nil)
      expect(user.full_name).to eq user.email
    end
  end
end
