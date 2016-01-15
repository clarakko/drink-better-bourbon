require 'rails_helper'

feature 'Sends email upon review', %{

  As a user
  I want to get notified via email
  when someone reviews my bourbon

  Acceptance Criteria
  [] I receive an email when someone reviews my bourbon

} do
  let!(:bourbon) { FactoryGirl.create(:bourbon, user: user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario "Email is sent someone reviews a bourbon successfully" do
    visit new_user_session_path

    fill_in "Username", with: user2.username
    fill_in "Password", with: user2.password
    click_button 'Sign In'

    visit bourbon_path(bourbon)

    click_link 'Review It'
    fill_in 'Description', with: 'The Best Bourbon Review'
    fill_in 'Rating', with: '6'
    click_button "Add Review"

    expect(page).to have_content("The Best Bourbon Review")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
