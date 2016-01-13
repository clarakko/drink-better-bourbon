require 'rails_helper'

feature "user searches for a bourbon by name", %{
  As a visitor
  I want to use the search bar
  So I can find the bourbon I'm looking form

  Acceptance Criteria:
  - [] I can use the search bar from the welcome page to search bourbons
  - [] I can use the search bar from the bourbons page to search for bourbons
  } do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bourbon1) { FactoryGirl.create(:bourbon, user: user) }
  let!(:bourbon2) { FactoryGirl.create(:bourbon, user: user) }

  scenario "user searches for a bourbon from the welcome page" do
    visit root_path
    fill_in "welcome-search-bar", with: bourbon1.name
    click_button "submit"
    expect(page).to have_content(bourbon1.name)
    expect(page).not_to have_content(bourbon2.name)
  end

  scenario "user searches for a bourbon from the bourbons page" do
    visit bourbons_path
    fill_in "bourbons-search-bar", with: bourbon1.name
    click_button "submit"
    expect(page).to have_content(bourbon1.name)
    expect(page).not_to have_content(bourbon2.name)
  end
end
