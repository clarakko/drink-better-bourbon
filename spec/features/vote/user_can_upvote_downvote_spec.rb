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


  Acceptance Criteria
  [x] I can cancel an upvote on a review


  Acceptance Criteria
  [x] I can cancel an downvote on a review

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

    click_link "Review It"
    fill_in "Description", with: review.description
    fill_in "Rating", with: review.rating
    click_button "Add Review"
    click_link "Up"

    expect(page).to have_content ("Upvoted!")
  end

  scenario "user downvotes a review" do
    visit new_user_session_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button "Sign In"

    visit bourbon_path(bourbon)

    click_link "Review It"
    fill_in "Description", with: review.description
    fill_in "Rating", with: review.rating
    click_button "Add Review"
    click_link "Down"

    expect(page).to have_content ("Downvoted!")
  end

  scenario "user cancels upvote" do
    visit new_user_session_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button "Sign In"

    visit bourbon_path(bourbon)

    click_link "Review It"
    fill_in "Description", with: review.description
    fill_in "Rating", with: review.rating
    click_button "Add Review"
    click_link "Up"
    click_link "Up"

    expect(page).to have_content ("Upvote cancelled!")
  end

  scenario "user cancels downvote" do
    visit new_user_session_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button "Sign In"

    visit bourbon_path(bourbon)

    click_link "Review It"
    fill_in "Description", with: review.description
    fill_in "Rating", with: review.rating
    click_button "Add Review"
    click_link "Down"
    click_link "Down"

    expect(page).to have_content ("Downvote cancelled!")
  end

  scenario "unauthenticated user does not see upvote" do
    visit bourbon_path(bourbon)

    expect(page).to_not have_content("Up")
  end
  scenario "unauthenticated user does not see downvote" do
    visit bourbon_path(bourbon)

    expect(page).to_not have_content("Down")
  end
end
