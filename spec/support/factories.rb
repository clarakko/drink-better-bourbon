require 'rails_helper'

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Pablo#{n}" }
    sequence(:email) { |n| "pablo#{n}@user.com" }
    password 'password'
    password_confirmation 'password'
  end
end

FactoryGirl.define do
  factory :bourbon do
    sequence(:name) { |n| "Angel's Envy#{n}" }
    sequence(:proof) { |n| "#{n}" }
    sequence(:distillery) { |n| "Louisville Distilling Co.#{n}" }
    sequence(:varietal) { |n| "Blended#{n}" }

    association :user, factory: :user
  end
end

FactoryGirl.define do
  factory :review do
    sequence(:description) { |n| "Good Bourbon#{n}" }
    sequence(:rating) { |n| "#{n}" }
    sequence(:bourbon_id) { |n| "#{n}" }
    sequence(:user_id) { |n| "#{n}" }

    association :bourbon, factory: :bourbon
    association :user, factory: :user
  end
end

FactoryGirl.define do
  factory :vote do
    vote '1'
    association :review, factory: :review
    association :user, factory: :user
  end
end
