require "rails_helper"

feature 'new user signs up', %{
  As a prospective user
  I want to sign up
  So that I can gain access in order to post new bourbons or review existing
  bourbons

  Acceptance Criteria
  [x] I will create an account from sign up page
  [x] I must specify a valid username
  [x] I must specify a valid e-mail
  [x] I must specify a password and confirm that password
  [x] I get error messages if I do not perform the above
  [x] I register my account and am authenticated if I specify valid information

} do
  scenario "prospective user gets to sign up page from root path" do
    visit root_path
    click_on "Sign Up"
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Password confirmation")
  end

  scenario "prospective user correctly submits sign up form" do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Johnny'
    fill_in 'Email', with: 'johnny@appleseed.com'
    fill_in 'Password', with: 'johnnygold'
    fill_in 'Password confirmation', with: 'johnnygold'
    attach_file "Profile Pic",
      "#{Rails.root}/spec/support/images/profile_pic.jpg"
    click_button 'Sign Up'

    expect(page).to have_content('Welcome! You are on your way to enjoying
    better bourbon.')
    expect(page).to have_content('Sign Out')

    visit edit_user_registration_path
    expect(page).to have_css("img[src*='profile_pic.jpg']")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'
    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content('Sign Out')
  end

  scenario 'password does not match confirmation' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'morepassword'
    click_button 'Sign Up'
    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content('Sign Out')
  end
end
