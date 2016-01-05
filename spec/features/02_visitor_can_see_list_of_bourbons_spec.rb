require 'rails_helper'

feature "The bourbon index page: " do
  let!(:bourbon) { FactoryGirl.create(:bourbon) }
  scenario "visitor can see list of bourbons on index page" do
    visit bourbons_path
    expect(page).to have_content bourbon.name
    expect(page).to have_content bourbon.distillery
  end

  scenario "visitor clicks link for bourbon show page" do
    visit bourbons_path
    click_link bourbon.name
    expect(current_path).to eq bourbon_path(bourbon)
    expect(page).to have_content bourbon.distillery
  end
end
