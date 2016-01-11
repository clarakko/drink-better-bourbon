require "rails_helper"

feature 'user deletes review', %{

  As a user
  I want to delete a review


  Acceptance Criteria
  [x] I can delete a review

} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:bourbon) { FactoryGirl.create(:bourbon, user: user) }

  before(:each) do
    visit new_user_session_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"

    visit bourbon_path(bourbon)

    click_link 'New Review'
    fill_in 'Description', with: 'Meh.'
    fill_in 'Rating', with: '42'
    click_button 'Add Review'
  end

  scenario "an authorized user can delete a review" do
    click_link "Delete"
    expect(page).to have_content('Review Wasted!')
    expect(page).to_not have_content('Meh.')
  end

  scenario "only authorized user can delete review" do
    click_link 'Sign Out'
    visit new_user_session_path
    fill_in "Username", with: user2.username
    fill_in "Password", with: user2.password
    click_button "Sign In"

    visit bourbon_path(bourbon)
    expect(page).to_not have_content('Delete')
  end
end
