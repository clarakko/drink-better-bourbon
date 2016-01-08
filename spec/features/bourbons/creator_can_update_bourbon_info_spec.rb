require 'rails_helper'

feature "The bourbon edit page: ", %{
  As an authenticated user
  I want to edit an existing bourbon I created
  So that I can make my bourbons more correct

  Acceptance Criteria
  [x] I am authenticated and I can access an update page to edit my
      bourbon.
  [x] I see errors if update form invalid
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:bourbon) { FactoryGirl.create(:bourbon, user: user) }
  let!(:malcontent) { FactoryGirl.create(:user) }

  before(:each) do
    visit new_user_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign In'
    visit bourbon_path(bourbon)
  end

  scenario "only item creator can see the edit page" do
    expect(page).to have_link "Update"

    click_link "Update"
    expect(page).to have_content "Update Bourbon Form"

    click_link 'Sign Out'
    visit bourbon_path(bourbon)
    expect(page).not_to have_link "Update"

    visit new_user_session_path
    fill_in 'Username', with: malcontent.username
    fill_in 'Password', with: malcontent.password
    click_button 'Sign In'

    visit bourbon_path(bourbon)
    expect(page).not_to have_link "Update"

    visit edit_bourbon_path(bourbon)
    expect(page).to have_content "You Are Not Authorized To View The Page"
  end

  scenario "creator validly edits the bourbon" do
    visit edit_bourbon_path(bourbon)

    expect(find_field("Name").value).to eq bourbon.name

    fill_in "Name", with: "Jim Beam 8 Year"
    click_button "Update Bourbon"

    expect(page).to have_content "Bourbon updated successfully"
  end

  scenario "creator invalidly edits bourbon" do
    visit edit_bourbon_path(bourbon)

    fill_in "Name", with: ""
    fill_in "Proof", with: ""
    click_button "Update Bourbon"

    expect(page).to have_content "Name can't be blank"
    expect(page).to have_content "Proof can't be blank"
    expect(page).to have_content "Proof is not a number"
  end
end
