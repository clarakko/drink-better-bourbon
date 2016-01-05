require 'rails_helper'


feature "visitor can add bourbon" do
  bourbon = FactoryGirl.create(:bourbon)
  # user = FactoryGirl.create(:user)

  # visit bourbon_path

  # click "Sign in"

  # fill_in "Username" with: user.name
  # fill_in "Password" with:
  scenario "visitor adds new bourbon successfully" do

    visit new_bourbon_path

    fill_in "Name", with: "anything"
    fill_in "Proof", with: bourbon.proof
    fill_in "Varietal", with: bourbon.varietal
    fill_in "Distillery", with: bourbon.distillery

    click_button "Add Bourbon"

    expect(page).to have_content "Bourbon added successfully"
    expect(page).to have_content bourbon.name
    expect(page).to have_content bourbon.distillery
  end


  scenario "visitor does not provide proper information for a bourbon" do

    visit new_bourbon_path

    click_button "Add Bourbon"
    expect(page).to have_content "Please fill out all fields"
  end
end
