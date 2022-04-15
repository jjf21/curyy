# frozen_string_literal: true

require "rails_helper"

feature "create" do
  let!(:user) { create(:user) }
  let!(:theme) { create(:theme) }

  before do
    login_as(user, scope: :user)
    visit cvs_path
  end

  scenario "can create a CV", js: true do
    expect(page).to have_content("No projects")
    click_on "Nouveau CV"

    # expect(page).to have_current_path(cv_path(Cv.last))
    expect(page).to have_content("Download CV")
    expect(page).to have_content("Changer de theme")
  end
end
