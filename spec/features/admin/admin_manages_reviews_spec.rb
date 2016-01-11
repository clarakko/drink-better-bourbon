require 'rails_helper'

feature "Admin manages user reviews:", %{
  As an admin
  I want to manage user reviews of bourbons
  So that I can remove inappropriate reviews
  Acceptance Criteria
  [X] I can see buttons to delete reviews on bourbon show page
  [X] I can destroy a user review
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:bourbon) { FactoryGirl.create(:bourbon, user: user) }
  let!(:review) { FactoryGirl.create(:review, bourbon: bourbon, user: user) }

  before(:each) do
    visit new_user_session_path
    fill_in 'Username', with: admin.username
    fill_in 'Password', with: admin.password
    click_button 'Sign In'
  end

  scenario 'admin deletes review' do
    visit bourbon_path(bourbon)
    expect(page).to have_content bourbon.name
    expect(page).to have_content review.description
    click_button('Delete')

    expect(page).to_not have_content(review.description)
  end
end
