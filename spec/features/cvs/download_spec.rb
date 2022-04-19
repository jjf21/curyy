# frozen_string_literal: true

require "rails_helper"

feature "download" do
  let!(:theme) { create(:theme, :hello_world) }
  let!(:user) { create(:user) }
  let!(:cv) { create(:cv, user:, theme:) }

  before do
    login_as(user, scope: :user)
  end

  scenario "Download button on CV", js: true do
    visit cv_path(cv)
    expect(page).to have_content("Download CV")
  end

  scenario "Download button on CV edition", js: true do
    visit edit_cv_path(cv)
    expect(page).to have_content("Download CV")
  end
end
