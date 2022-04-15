# frozen_string_literal: true

require "rails_helper"

feature "download" do
  let!(:theme) { create(:theme) }
  let!(:user) { create(:user) }
  let!(:cv) { create(:cv, user:, theme:) }

  before do
    login_as(user, scope: :user)
    visit cv_path(cv)
  end

  scenario "Download a CV", js: true do
    expect(page).to have_content("Download CV")
    click_on "Download CV"

    # expect(page).to have_current_path(cv_path(Cv.last))
    expect(page).to have_content("Changer de theme")
  end
end
