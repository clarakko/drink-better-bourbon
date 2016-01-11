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
  let!(:review1) { FactoryGirl.create(:review) }
  let!(:review2) { FactoryGirl.create(:review) }
  let!(:review3) { FactoryGirl.create(:review) }

  scenario "user upvotes a review" do
    visit new_user_session_path
    
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button "Sign In"

    visit bourbon_path(bourbon)

    click_link "New Review"
    fill_in "Description", with: review.description
    fill_in "Rating", with: review.rating
    click_button "Add Review"
    click_link "Upvote"

    expect(page).to have_content ("1")
    expect(page).to have_content ("Vote early, vote often")
    expect(page).to_not have_content ("You've already upvoted")
  end

  scenario "user downvotes a review" do
    visit new_user_session_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button "Sign In"

    visit bourbon_path(bourbon)

    click_link "New Review"
    fill_in "Description", with: review1.description
    fill_in "Rating", with: review1.rating
    click_button "Add Review"
    click_link "Downvote"

    expect(page).to have_content ("-1")
    expect(page).to have_content ("Vote early, vote often")
    expect(page).to_not have_content ("You've already downvoted")
  end


  scenario "user upvotes a review more than once" do
    visit new_user_session_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button "Sign In"

    visit bourbon_path(bourbon)

    click_link "New Review"
    fill_in "Description", with: review2.description
    fill_in "Rating", with: review2.rating
    click_button "Add Review"
    click_link "Upvote"
    click_link "Upvote"

    expect(page).to have_content ("1")
    expect(page).to have_content ("You've already upvoted")
    expect(page).to_not have_content ("Vote early, vote often")
  end

  scenario "user upvotes a review more than once" do
    visit new_user_session_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button "Sign In"

    visit bourbon_path(bourbon)

    click_link "New Review"
    fill_in "Description", with: review3.description
    fill_in "Rating", with: review3.rating
    click_button "Add Review"
    click_link "Downvote"
    click_link "Downvote"

    expect(page).to have_content ("-1")
    expect(page).to have_content ("You've already downvoted")
    expect(page).to_not have_content ("Vote early, vote often")
  end
end
