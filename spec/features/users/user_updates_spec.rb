require "rails_helper"

feature 'user updates information', %{
  As an authenticated user
  I want to update my information
  So that I can keep my profile up to date

  Acceptance Criteria
  [x] I will be able to update from the Settings page if I am authenticated
  [x] I can leave any field blank that I do not wish to change
  [x] I cannot change any field without entering my current password
  [x] I must confirm my new password if I wish to change my password
} do

  scenario "authenticated user goes to settings page" do
    user = FactoryGirl.create(:user)
    visit root_path
    expect(page).to_not have_content('Edit User')
    click_link 'Sign In'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_on "Settings"
    expect(page).to have_content("Edit User")
  end

  scenario "User changes one field only" do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_on "Settings"
    fill_in "Email", with: 'jojo@gmail.com'
    fill_in "Current password", with: user.password
    click_button 'Update'
    expect(page).to have_content('Your account has been updated successfully.')
  end

  scenario 'User fails to enter current password' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_on "Settings"
    fill_in "Email", with: 'jojo@gmail.com'
    click_button 'Update'
    expect(page).to have_content('Current password can\'t be blank')
  end

  scenario 'User fails to confirm new password' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    click_on "Settings"
    fill_in "Password", with: 'NewPassword'
    fill_in "Current password", with: user.password
    click_button 'Update'
    expect(page).to have_content('Password confirmation doesn\'t match')
  end
end
