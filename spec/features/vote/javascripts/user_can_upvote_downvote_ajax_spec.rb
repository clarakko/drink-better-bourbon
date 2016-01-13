require "rails_helper"

feature 'user votes', %{

  As an authenticated user
  I want to upvote or downvote reviews
  So that reviews can be ranked without reloading page

  Acceptance Criteria
  [x] I can upvote a review without reloading page
  [x] I cannot upvote if I am not signed in


  Acceptance Criteria
  [x] I can downvote a review without reloading page
  [x] I cannot downvote if I am not signed in


  Acceptance Criteria
  [x] I can cancel an upvote on a review without reloading page


  Acceptance Criteria
  [x] I can cancel an downvote on a review without reloading page

} do
  let!(:bourbon) { FactoryGirl.create(:bourbon) }

  scenario "user upvotes a review", js: true do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Johnny'
    fill_in 'Email', with: 'johnny@appleseed.com'
    fill_in 'Password', with: 'johnnygold'
    fill_in 'Password confirmation', with: 'johnnygold'
    click_button "Sign Up"

    visit new_bourbon_path

    fill_in "Name", with: "Angel's Envy"
    fill_in "Proof", with: "99"
    fill_in "Varietal", with: "Blended"
    fill_in "Distillery", with: "Louisville Distilling Co."
    click_button "Add Bourbon"

    click_link "New Review"
    fill_in "Description", with: "thing"
    fill_in "Rating", with: "9"
    click_button "Add Review"
    click_link "Upvote"

    expect(page).to have_content ("1")
  end

  scenario "user downvotes a review", js: true do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Johnny'
    fill_in 'Email', with: 'johnny@appleseed.com'
    fill_in 'Password', with: 'johnnygold'
    fill_in 'Password confirmation', with: 'johnnygold'
    click_button "Sign Up"

    click_link "Add Bourbon"

    fill_in "Name", with: "Angel's Envy"
    fill_in "Proof", with: "99"
    fill_in "Varietal", with: "Blended"
    fill_in "Distillery", with: "Louisville Distilling Co."
    click_button "Add Bourbon"

    click_link "New Review"
    fill_in "Description", with: "thing"
    fill_in "Rating", with: "9"
    click_button "Add Review"
    click_link "Downvote"

    expect(page).to have_content ("-1")
  end

  scenario "user cancels upvote", js: true do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Johnny'
    fill_in 'Email', with: 'johnny@appleseed.com'
    fill_in 'Password', with: 'johnnygold'
    fill_in 'Password confirmation', with: 'johnnygold'
    click_button "Sign Up"

    click_link "Add Bourbon"

    fill_in "Name", with: "Angel's Envy"
    fill_in "Proof", with: "99"
    fill_in "Varietal", with: "Blended"
    fill_in "Distillery", with: "Louisville Distilling Co."
    click_button "Add Bourbon"

    click_link "New Review"
    fill_in "Description", with: "thing"
    fill_in "Rating", with: "9"
    click_button "Add Review"
    click_link "Upvote"
    click_link "Upvote"

    expect(page).to have_content ("0")
  end

  scenario "user cancels downvote", js: true do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Johnny'
    fill_in 'Email', with: 'johnny@appleseed.com'
    fill_in 'Password', with: 'johnnygold'
    fill_in 'Password confirmation', with: 'johnnygold'
    click_button "Sign Up"

    click_link "Add Bourbon"

    fill_in "Name", with: "Angel's Envy"
    fill_in "Proof", with: "99"
    fill_in "Varietal", with: "Blended"
    fill_in "Distillery", with: "Louisville Distilling Co."
    click_button "Add Bourbon"

    click_link "New Review"
    fill_in "Description", with: "thing"
    fill_in "Rating", with: "9"
    click_button "Add Review"
    click_link "Downvote"
    click_link "Downvote"

    expect(page).to have_content ("0")
  end

  scenario "unauthenticated user does not see upvote", js: true do
    visit bourbon_path(bourbon)

    expect(page).to_not have_content("Upvote")
  end
  scenario "unauthenticated user does not see downvote", js: true do
    visit bourbon_path(bourbon)

    expect(page).to_not have_content("Downvote")
  end
end
