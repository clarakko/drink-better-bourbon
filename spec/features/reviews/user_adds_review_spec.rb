require "rails_helper"

feature 'user creates review', %{

  As a user
  I want to add a review


  Acceptance Criteria
  [] I can add a review
  [] I cannot add a review without filling all fields



} do

  let!(:bourbon) { FactoryGirl.create(:bourbon) }
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) do
    visit new_user_session_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button 'Sign In'

    visit bourbon_path(bourbon)
    click_link 'New Review'
  end

  scenario "a user adds a review" do
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


