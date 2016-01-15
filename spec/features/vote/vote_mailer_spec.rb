require 'rails_helper'

feature 'Sends email upon a successful vote', %{

  As a user
  I want to get notified via email
  when someone votes on my review

  Acceptance Criteria
  [X] I receive an email when someone upvotes on my review
  [X] I receive an email when someone downvotes on my review
  [X] I do not receive an email when someone cancels their downvote
  [X] I do not receive an email when someone cancels their upvote
} do

  let!(:bourbon) { FactoryGirl.create(:bourbon, user: user) }
  let!(:user) { FactoryGirl.create(:user) }
  let!(:review) { FactoryGirl.create(:review, bourbon: bourbon, user: user) }
  let!(:user2) { FactoryGirl.create(:user) }

  scenario "Email is sent when someone upvotes successfully" do
    ActionMailer::Base.deliveries = []
    visit new_user_session_path

    fill_in "Username", with: user2.username
    fill_in "Password", with: user2.password
    click_button 'Sign In'

    visit bourbon_path(bourbon)

    click_link 'Up'

    expect(page).to have_content("1")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario "Email is sent when someone upvotes successfully" do
    ActionMailer::Base.deliveries = []
    visit new_user_session_path

    fill_in "Username", with: user2.username
    fill_in "Password", with: user2.password
    click_button 'Sign In'

    visit bourbon_path(bourbon)

    click_link 'Down'

    expect(page).to have_content("-1")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario "Email is not sent when downvote is cancelled" do
    ActionMailer::Base.deliveries = []
    visit new_user_session_path

    fill_in "Username", with: user2.username
    fill_in "Password", with: user2.password
    click_button 'Sign In'

    visit bourbon_path(bourbon)

    click_link 'Down'

    click_link 'Down'

    expect(page).to have_content("0")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario "Email is not sent when upvote is cancelled" do
    ActionMailer::Base.deliveries = []
    visit new_user_session_path

    fill_in "Username", with: user2.username
    fill_in "Password", with: user2.password
    click_button 'Sign In'

    visit bourbon_path(bourbon)

    click_link 'Up'

    click_link 'Up'

    expect(page).to have_content("0")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
