require "rails_helper"

feature 'user views review', %{
  A user or vistor
  I want to view reviews

  Acceptance Criteria
  [] I can view reviews

} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:bourbon) { FactoryGirl.create(:bourbon, user: user) }

  before(:each) do
    visit new_user_session_path

    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign In"
    visit bourbon_path(bourbon)
  end

  scenario "a user can view reviews" do
    review = FactoryGirl.create(:review)
    user1 = FactoryGirl.create(:user)
    visit bourbon_path(bourbon)
    click_link "New Review"
    fill_in 'Description', with: review.description
    fill_in 'Rating', with: review.rating
    click_on 'Add Review'
    click_on 'Sign Out'

    visit new_user_session_path

    fill_in "Username", with: user1.username
    fill_in "Password", with: user1.password
    click_button "Sign In"
    visit bourbon_path(bourbon)

    expect(page).to have_content review.description
    expect(page).to have_content review.rating
  end
end
