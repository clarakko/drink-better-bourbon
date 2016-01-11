require 'rails_helper'

feature "Admin views bourbons: ", %{
  As an admin
  I want to manage bourbons
  So that I can update or remove inapprpriate submissions

  Acceptance Criteria
  [x] I see delete option on bourbon index page if I am an admin
  [x] I can update an existing bourbon
  [x] I can destroy an existing bourbon
}  do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:bourbon) { FactoryGirl.create(:bourbon, user: user) }

  before(:each) do
    visit new_user_session_path
    fill_in 'Username', with: admin.username
    fill_in 'Password', with: admin.password
    click_button 'Sign In'
  end

  scenario "admin sees delete on bourbon index path" do
    visit bourbons_path
    expect(page).to have_button 'Delete'

    click_link 'Sign Out'
    visit bourbons_path
    expect(page).to_not have_button 'Delete'
  end

  scenario "Admin updates existing bourbon" do
    visit bourbons_path
    click_link 'Update'

    expect(find_field('Name').value).to eq bourbon.name

    fill_in 'Name', with: 'Updated bourbon'
    click_on 'Update Bourbon'

    expect(page).to have_content('Updated bourbon')
  end

  scenario "Admin destroys existing bourbon" do
    visit bourbons_path
    click_button 'Delete'
    expect(current_path).to eq bourbons_path
    expect(page).not_to have_content(bourbon.name)
  end
end
