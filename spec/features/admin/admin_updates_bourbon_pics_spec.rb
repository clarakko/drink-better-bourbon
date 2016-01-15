require 'rails_helper'

feature "Admin manages bourbon image:", %{
  As an admin
  I want to add images to bourbons and update them
  So that users can better appreciate fine bourbon

  Acceptance Criteria
  [X] I can see an index of bourbons without images as an admin
  [X] I can optionally upload a picture for each bourbon as an admin
} do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:bourbon) { FactoryGirl.create(:bourbon, user: user) }

  before(:each) do
    visit new_user_session_path
    fill_in 'Username', with: admin.username
    fill_in 'Password', with: admin.password
    click_button 'Sign In'
  end

  scenario 'admin sees bourbons without images index' do
    visit admin_bourbons_path
    expect(page).to have_content bourbon.name
  end

  scenario 'admin adds image from index page' do
    visit admin_bourbons_path

    attach_file "bourbon_bourbon_img",
      "#{Rails.root}/spec/support/profile_pic.jpg"

    click_on 'Add Image'
    expect(page).to have_content 'Bourbon updated successfully'
  end

  scenario 'admin adds image from admin bourbon update page' do
    visit admin_bourbons_path
    click_link 'Update'

    expect(page).to have_field 'Bourbon Image'

    attach_file 'Bourbon Image',
      "#{Rails.root}/spec/support/profile_pic.jpg"

    click_on 'Update Bourbon'
    expect(page).to have_content 'Bourbon updated successfully'
  end
end
