# frozen_string_literal: true

require "rails_helper"

feature "Signup" do
  let(:user) { build(:user) }

  before do
    visit new_user_registration_path
  end

  scenario "can signup successfully" do
    expect(page).to have_content("Inscription")
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "Mot de passe", with: user.password.to_s
    fill_in "Confirmation du mot de passe", with: user.password.to_s

    click_on "S'inscrire"

    expect(page).to have_content("Get started by creating a new project")
  end

  scenario "without complete informations" do
    expect(page).to have_content("Inscription")
    fill_in "Email", with: user.email
    fill_in "Mot de passe", with: user.password.to_s
    fill_in "Confirmation du mot de passe", with: user.password.to_s

    click_on "S'inscrire"

    expect(page).to have_content("Vérifier les informations erronées")
  end
end
