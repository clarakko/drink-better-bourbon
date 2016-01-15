require "rails_helper"

feature 'user votes', %{

  As an authenticated user
  I want to upvote or downvote reviews
  So that reviews can be ranked without reloading page

  Acceptance Criteria
  [x] I can upvote a review without reloading page
  [x] I cannot upvote if I am not signed in
  [x] I can downvote a review without reloading page
  [x] I cannot downvote if I am not signed in
  [x] I can cancel an upvote on a review without reloading page
  [x] I can cancel an downvote on a review without reloading page

} do
  before(:each) do
    visit root_path
    click_link 'Sign In'
    click_link 'Sign up'
    fill_in 'Username', with: 'Johnny'
    fill_in 'Email', with: 'johnny@appleseed.com'
    fill_in 'Password', with: 'johnnygold'
    fill_in 'Password confirmation', with: 'johnnygold'
    click_button "Sign Up"

    visit bourbons_path
    click_link "Add Bourbon"

    fill_in "Name", with: "Angel's Envy"
    fill_in "Proof", with: "99"
    fill_in "Distillery", with: "Louisville Distilling Co."
    click_button "Add Bourbon"

    click_link "Review It"
    fill_in "Description", with: "thing"
    fill_in "Rating", with: "9"
    click_button "Add Review"
  end

  let!(:bourbon) { FactoryGirl.create(:bourbon) }

  scenario "user upvotes a review", js: true do
    click_link "Up"

    expect(page).to have_content ("1")
  end

  scenario "user downvotes a review", js: true do
    click_link "Down"

    expect(page).to have_content ("-1")
  end

  scenario "user cancels upvote", js: true do
    click_link "Up"
    click_link "Up"

    expect(page).to have_content ("0")
  end

  scenario "user cancels downvote", js: true do
    click_link "Down"
    click_link "Down"

    expect(page).to have_content ("0")
  end
end
