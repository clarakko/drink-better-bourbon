FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Pablo#{n}" }
    sequence(:email) { |n| "pablo#{n}@user.com" }
    password 'password'
    password_confirmation 'password'
  end
end
