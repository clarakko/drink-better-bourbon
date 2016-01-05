require 'rails_helper'

feature "The bourbon edit page: " do
  let!(:bourbon) { FactoryGirl.create(:bourbon) }
  scenario "creator can sees the edit page" do
    visit bourbon_path(bourbon)
    click_link "Update"
    expect(page).to have_content "Update Bourbon Form"
  end

  scenario "creator edits the bourbon info" do
    visit edit_bourbon_path(bourbon)
    expect(find_field("Name").value).to eq bourbon.name
    fill_in "Name", with: "Jim Beam 8 Year"
    click_button "Add Bourbon"
    expect(page).to have_content "Jim Beam 8 Year"
  end
end
