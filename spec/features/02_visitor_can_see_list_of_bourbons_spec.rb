require 'rails_helper'


feature "the bourbon index page" do
  bourbon = FactoryGirl.create(:bourbon)
  before(:all) do
    visit new_bourbon_path
    fill_in "Name", with: "other"
    fill_in "Proof", with: bourbon.proof
    fill_in "Varietal", with: bourbon.varietal
    fill_in "Distillery", with: bourbon.distillery
  end
  scenario "visitor can see list of bourbons on index page" do

    click_button "Add Bourbon"

    visit bourbon_path

    expect(page).to have_content "Angel's Envy"
    expect(page).to have_content "Louisville Distilling Co."
  end


  scenario "visitor clicks on bourbon link and is brought to bourbon show page" do

    visit bourbon_path

    click_link bourbon.name

    expect(page).to have_content

  end
end
