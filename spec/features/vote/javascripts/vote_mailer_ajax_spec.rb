require "rails_helper"

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
  before(:each) do
    visit root_path
    click_link 'Sign In'
    click_link 'Sign up'
    fill_in 'Username', with: 'Johnny'
    fill_in 'Email', with: 'johnny@appleseed.com'
    fill_in 'Password', with: 'johnnygold'
    fill_in 'Password confirmation', with: 'johnnygold'
    click_button "Sign Up"

    visit bourbons_path
    click_link "Add Bourbon"

    fill_in "Name", with: "Angel's Envy"
    fill_in "Proof", with: "99"
    fill_in "Varietal", with: "Blended"
    fill_in "Distillery", with: "Louisville Distilling Co."
    click_button "Add Bourbon"

    click_link "New Review"
    fill_in "Description", with: "thing"
    fill_in "Rating", with: "9"
    click_button "Add Review"
  end

  let!(:bourbon) { FactoryGirl.create(:bourbon) }

  scenario "user upvotes a review", js: true do
    ActionMailer::Base.deliveries = []
    click_link "Upvote"

    expect(page).to have_content ("1")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario "user downvotes a review", js: true do
    ActionMailer::Base.deliveries = []
    click_link "Downvote"

    expect(page).to have_content ("-1")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario "user cancels a downvote", js: true do
    ActionMailer::Base.deliveries = []
    click_link "Downvote"

    click_link "Downvote"

    expect(page).to have_content ("0")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end

  scenario "user cancels an upvote", js: true do
    ActionMailer::Base.deliveries = []
    click_link "Upvote"

    click_link "Upvote"

    expect(page).to have_content ("0")
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end


