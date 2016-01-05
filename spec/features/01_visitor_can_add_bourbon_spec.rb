require 'rails_helper'


feature "The bourbon add page: " do
  scenario "visitor adds new bourbon successfully" do
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

  scenario "visitor does not provide proper information for a bourbon" do
    visit new_bourbon_path
    click_button "Add Bourbon"
    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Proof can't be blank"
  end
end
