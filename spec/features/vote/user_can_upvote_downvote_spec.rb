require "rails_helper"

feature 'user votes', %{

  As an authenticated user
  I want to upvote or downvote reviews
  So that reviews can be ranked

  Acceptance Criteria
  [x] I can upvote a review
  [x] I cannot upvote if I am not signed in


  Acceptance Criteria
  [x] I can downvote a review
  [x] I cannot downvote if I am not signed in

} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:bourbon) { FactoryGirl.create(:bourbon) }
  let!(:review) { FactoryGirl.create(:review) }

  scenario "user upvotes a review" do
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button "Sign In"

    visit bourbon_path(bourbon)

    click_on "Upvote"

    expect(page).to have_content ("1")
  end

  scenario "user downvotes a review" do
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button "Sign In"

    visit bourbon_path(bourbon)

    click_on "Downvote"

    expect(page).to have_content ("-1")
  end
end
