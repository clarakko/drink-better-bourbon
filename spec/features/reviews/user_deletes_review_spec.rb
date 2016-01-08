require "rails_helper"

feature 'user deletes review', %{

  As a user
  I want to delete a review


  Acceptance Criteria
  [x] I can delete a review

} do

  let!(:bourbon) { FactoryGirl.create(:bourbon) }
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit new_user_session_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"
    visit bourbon_path(bourbon)
  end

  scenario "a user deletes a review" do
    review = FactoryGirl.create(:review)
    click_link 'New Review'
    fill_in 'Description', with: 'Meh.'
    fill_in 'Rating', with: '42'
    click_button 'Add Review'
    click_link "Delete"
    expect(page).to have_content('Review Wasted!')
    expect(page).to_not have_content(review.description)
  end
end
