require 'rails_helper'

feature "user searches for a bourbon by name", %{
  As a visitor
  I want to use the search bar
  So I can find the bourbon I'm looking for

  Acceptance Criteria:
  - [] I can use the search bar from the welcome page to search bourbons
  - [] I can use the search bar from the bourbons page to search for bourbons
  } do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:bourbon1) { FactoryGirl.create(:bourbon, user: user) }

  before(:each) do
    visit new_user_session_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button 'Sign In'
  end

  scenario "user searches for a bourbon from the welcome page" do
    visit bourbons_path
    click_on "Add Bourbon"
    fill_in "Name", with: "Other Bourbon"
    fill_in "Proof", with: "99"
    click_on "Add Bourbon"
    visit root_path
    fill_in "welcome-search-bar-center", with: bourbon1.name
    click_on "submit"
    expect(page).to have_content(bourbon1.name)
    expect(page).not_to have_content("Other Bourbon")
  end

  scenario "user searches for a bourbon from the bourbons page" do
    visit bourbons_path
    click_on "Add Bourbon"
    fill_in "Name", with: "Totally Different"
    fill_in "Proof", with: "99"
    click_on "Add Bourbon"
    visit bourbons_path
    fill_in "bourbons-search-bar", with: bourbon1.name
    click_on "submit"
    expect(page).to have_content(bourbon1.name)
    expect(page).not_to have_content("Totally Different")
  end
end
