require "rails_helper"

feature 'user updates review', %{

  As a user
  I want the option to update a review


  Acceptance Criteria
  [] I can update a review
  [] I can cancel an update review



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

  scenario "a user updates a review" do
    review = FactoryGirl.create(:review)
    click_link "Review It"
    fill_in 'Description', with: review.description
    fill_in 'Rating', with: review.rating
    click_on 'Add Review'
    click_link "Edit"
    fill_in 'Description', with: "Different Review"
    fill_in 'Rating', with: "99"
    click_button "Update Review"
    expect(page).to have_content('Review updated successfully')
    expect(page).to have_content("Different Review")
  end

  scenario "a user cancels update review" do
    review = FactoryGirl.create(:review)
    click_link "Review It"
    fill_in 'Description', with: review.description
    fill_in 'Rating', with: review.rating
    click_on 'Add Review'
    click_link "Edit"
    click_link "Cancel"
    expect(page).to have_content(review.description)
  end
end
