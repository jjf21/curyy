# frozen_string_literal: true

require "rails_helper"

feature "Login" do
  let!(:user) { create(:user) }

  before do
    visit root_path
  end

  scenario "can login successfully" do
    click_on "Se connecter"

    expect(page).to have_content("Connexion")
    fill_in "Email", with: user.email
    fill_in "Mot de passe", with: user.password.to_s

    click_on "Se connecter"

    expect(page).to have_content("Get started by creating a new project")
  end
end
