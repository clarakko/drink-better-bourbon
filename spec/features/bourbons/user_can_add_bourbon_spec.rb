require 'rails_helper'

feature "The bourbon add page: ", %{
  As a user
  I want to add a bourbon
  So that I can introduce new bourbon to the world

  Acceptance Criteria
  [x] I am authenticated and can access the new bourbon form.
  [] I cannot access new bourbon form if I am not authenticated
  [x] I can create a new bourbon with valid info
  [x] I cannot create a new bourbon with invalid form info
  [x] I can only add a bourbon if it has not already been added
} do

  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit new_user_session_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button 'Sign In'
  end

  scenario "authenticated user access new bourbon form" do
    click_link 'Add Bourbon'
    expect(page).to have_content('New Bourbon Form')
  end

  scenario "authenticated user adds new bourbon successfully" do
    visit new_bourbon_path

    fill_in "Name", with: "Angel's Envy"
    fill_in "Proof", with: "80.6"
    fill_in "Varietal", with: "Blended"
    fill_in "Distillery", with: "Louisville Distilling Co."
    click_button "Add Bourbon"
    expect(page).to have_content "Bourbon added successfully"
    expect(page).to have_content "Angel's Envy"
    expect(page).to have_content "Louisville Distilling Co."
  end

  scenario "authenticated user does not provide proper information for a bourbon" do
    visit new_bourbon_path
    click_button "Add Bourbon"

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Proof can't be blank"
  end

  scenario "authenticated user adds repeat bourbon" do
    visit new_bourbon_path

    fill_in "Name", with: "Angel's Envy"
    fill_in "Proof", with: "80.6"
    fill_in "Varietal", with: "Blended"
    fill_in "Distillery", with: "Louisville Distilling Co."
    click_button "Add Bourbon"

    visit new_bourbon_path

    fill_in "Name", with: "Angel's Envy"
    fill_in "Proof", with: "80.6"
    fill_in "Varietal", with: "Blended"
    fill_in "Distillery", with: "Louisville Distilling Co."
    click_button "Add Bourbon"
  end

  scenario "unauthenticated user cannot see add new bourbon link" do
    click_link 'Sign Out'
    visit bourbons_path
    expect(page).to_not have_content('Add Bourbon')
  end

  scenario "authenticated user cancels new bourbon submission" do
    visit new_bourbon_path
    click_link 'Cancel'
    expect(current_path).to eq bourbons_path
  end
end
