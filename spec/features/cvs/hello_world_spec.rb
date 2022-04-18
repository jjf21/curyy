# frozen_string_literal: true
# require "pry"
require "rails_helper"

feature "hello_world theme edition" do
  let!(:theme) { create(:theme, :hello_world) }
  let!(:user) { create(:user) }
  let!(:cv) { create(:cv, user:, theme:) }
  let!(:new_user) { build(:user,
    first_name: "Marco",
    last_name: "Polo",
    headline: "Founder Curyy",
    phone: "00 00 00 00 00",
    cv_email: "test@curyy.com",
    address: "Lille, France",
  )}
  let!(:new_colors) { {
    header_bg: "#0096c7",
    body_bg: "#ffffff",
    main_color: "#d62828",
    text_color: "#000080"
  } }

  before do
    login_as(user, scope: :user)
    visit edit_cv_path(cv.id)
    # Verify CV content
    expect(page).to have_content(/#{user.first_name}/i)
    expect(page).to have_content(/#{user.last_name}/i)
    expect(page).to have_content(/#{user.headline}/i)
    expect(page).to have_content(/Contact/i)
    expect(page).to have_content(/Experiences professionnelles/i)
    expect(page).to have_content(/Formations/i)
    expect(page).to have_content(/Compétences/i)
    expect(page).to have_content(/Outils/i)
    expect(page).to have_content(/Langues/i)
  end

  scenario "Edit CV content", js: true do #, debug: true
    ### Edition
    # Edit User
    click_and_fill(user.first_name, new_user.first_name)
    click_and_fill(user.last_name, new_user.last_name)
    click_and_fill(user.headline, new_user.headline)
    click_and_fill(user.phone, new_user.phone)
    click_and_fill(user.cv_email, new_user.cv_email)
    click_and_fill(user.address, new_user.address)
    # Edit Skills (tool, language, skill)
    click_and_fill(user.skill_skills.first.name, "Edited Skill")
    click_and_fill(user.language_skills.first.name, "Edited Language")
    click_and_fill(user.tool_skills.first.name, "Edited Tool")
    # Edit Experiences (work, education)
    click_and_fill(user.work_experiences.first.title, "Edited Work title")
    click_and_fill(user.work_experiences.first.company, "Edited Work company")
    click_and_fill(user.work_experiences.first.location, "Edited Work location")
    click_and_fill(user.work_experiences.first.start_date, "Edited Work start_date")
    click_and_fill(user.work_experiences.first.end_date, "Edited Work end_date")
    click_and_fill(user.work_experiences.first.description, "Edited Work description")
    click_and_fill(user.education_experiences.first.title, "Edited Education title")
    click_and_fill(user.education_experiences.first.company, "Edited Education school")
    click_and_fill(user.education_experiences.first.location, "Edited Education location")
    click_and_fill(user.education_experiences.first.start_date, "Edited Education start_date")
    click_and_fill(user.education_experiences.first.end_date, "Edited Education end_date")

    ### Verification
    visit edit_cv_path(cv.id)
    # Verify User
    expect(page).to have_content(/#{new_user.first_name}/i)
    expect(page).to have_content(/#{new_user.last_name}/i)
    expect(page).to have_content(/#{new_user.headline}/i)
    expect(page).to have_content(/#{new_user.phone}/i)
    expect(page).to have_content(/#{new_user.cv_email}/i)
    expect(page).to have_content(/#{new_user.address}/i)
    # Verify Skills
    expect(page).to have_content(/Edited Skill/i)
    expect(page).to have_content(/Edited Language/i)
    expect(page).to have_content(/Edited Tool/i)
    # Verify Experiences
    expect(page).to have_content(/Edited Work/i)
    expect(page).to have_content(/Edited Work company/i)
    expect(page).to have_content(/Edited Work location/i)
    expect(page).to have_content(/Edited Work start_date/i)
    expect(page).to have_content(/Edited Work end_date/i)
    expect(page).to have_content(/Edited Work description/i)
    expect(page).to have_content(/Edited Education/i)
    expect(page).to have_content(/Edited Education school/i)
    expect(page).to have_content(/Edited Education location/i)
    expect(page).to have_content(/Edited Education start_date/i)
    expect(page).to have_content(/Edited Education end_date/i)
  end

  scenario "Edit CV colors", js: true do
    ### EDITION
    click_on("Arrière plan")
    set_color(target: '#cv_header', input: '#cv_header_bg', value: cv.header_bg, css_attr: 'background-color')
    set_color(target: '#cv_body', input: '#cv_body_bg', value: cv.body_bg, css_attr: 'background-color')
    click_on("Textes")
    set_color(target: '.text-main', input: '#cv_main_color', value: cv.main_color, css_attr: 'color')
    set_color(target: '.bg-main', input: '#cv_main_color', value: new_colors[:main_color], css_attr: 'background-color')
    set_color(target: '#cv_body', input: '#cv_text_color', value: cv.text_color, css_attr: 'color')

    ### Verification
    visit edit_cv_path(cv.id)
    verify_color(target: "#cv_header", value: new_colors[:header_bg], css_attr: "background-color")
    verify_color(target: "#cv_body", value: new_colors[:body_bg], css_attr: "background-color")
    verify_color(target: ".text-main", value: new_colors[:main_color], css_attr: "color")
    verify_color(target: ".bg-main", value: new_colors[:main_color], css_attr: "background-color")
    verify_color(target: "#cv_body", value: new_colors[:text_color], css_attr: "color")

    ### Reset
    click_on "Remise à zéro"
    verify_color(target: "#cv_header", value: theme.header_bg, css_attr: "background-color")
    verify_color(target: "#cv_body", value: theme.body_bg, css_attr: "background-color")
    verify_color(target: ".text-main", value: theme.main_color, css_attr: "color")
    verify_color(target: ".bg-main", value: theme.main_color, css_attr: "background-color")
    verify_color(target: "#cv_body", value: theme.text_color, css_attr: "color")
  end

  def click_and_fill(content, new_content)
    el = find('span', text: /#{content.strip}/i, match: :first)
    el.click
    el.set(new_content)
    find('section', class:'page').click
    expect(page).to have_content(/#{new_content}/i)
    sleep(0.4) # Wait for turbo to render
  end

  def hex_color_to_rgba(hex)
    rgb = hex.match(/^#(..)(..)(..)$/).captures.map(&:hex)
    "rgba(#{rgb.join(", ")}, 1)"
  end

  def set_color(target:, input:, value:, css_attr:)
    verify_color(target: target, value: value, css_attr: css_attr)
    find("#{input}").click
    find('#clr-color-value')
    new_value = new_colors[input.remove('#cv_').to_sym]
    find('#clr-color-value').set(new_value, fill_options: { clear: :backspace })
    find('section', class:'page').click # Force on change event not triggering
    page.execute_script("document.querySelector('#{input}').dispatchEvent(new Event('change'))")
    verify_color(target: target, value: new_value, css_attr: css_attr)
  end

  def verify_color(target:, css_attr:, value:)
    expect(find(target, match: :first).native.css_value(css_attr)).to eq hex_color_to_rgba(value)
  end
end

