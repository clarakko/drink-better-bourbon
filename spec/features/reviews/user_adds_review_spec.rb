require "rails_helper"

feature 'user creates review', %{

  As a user
  I want to add a review

  Acceptance Criteria
  [x] I am not authenticated and I cannot add a review
  [x] I am authenticated and I can add a review
  [x] I cannot add a review without filling all fields
} do

  let!(:bourbon) { FactoryGirl.create(:bourbon, user: user) }
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit new_user_session_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button 'Sign In'

    visit bourbon_path(bourbon)
    click_link 'New Review'
  end

  scenario "an unauthenticated user cannot add a review" do
    click_link 'Sign Out'
    visit bourbon_path(bourbon)

    expect(page).not_to have_link('Add Review')

    visit new_bourbon_review_path(bourbon)
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario "an authenticated user adds a review" do
    review = FactoryGirl.create(:review)
    fill_in 'Description', with: review.description
    fill_in 'Rating', with: review.rating
    click_on 'Add Review'

    expect(page).to have_content('Review added successfully')
  end

  scenario "a user must fill out all fields" do
    click_on 'Add Review'

    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Rating can't be blank")
  end

  scenario "a user cancels add review" do
    click_on 'Add Review'
    click_link "Cancel"

    expect(current_path).to eq bourbon_path(bourbon)
  end
end
