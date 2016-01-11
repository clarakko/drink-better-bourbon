require 'rails_helper'

feature "Admin manages user:", %{
  As an admin
  I want to delete users
  So that I can remove inappropriate users

  Acceptance Criteria
  [X] I can see an index page of users
  [X] I can see buttons to delete users
  [X] I can destroy a user
}  do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }

  before(:each) do
    visit new_user_session_path
    fill_in 'Username', with: admin.username
    fill_in 'Password', with: admin.password
    click_button 'Sign In'
  end

  scenario 'admin sees users' do
    visit admin_users_path
    expect(page).to have_content user.username
  end

  scenario 'admin deletes user' do
    visit admin_users_path
    click_button("user-#{user.id}")

    expect(page).to_not have_content user.username
  end
end
