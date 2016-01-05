require 'rails_helper'

FactoryGirl.define do
  factory :bourbon do
    sequence(:name) { |n| "Angel's Envy#{n}" }
    sequence(:proof) { |n| "#{n}" }
    sequence(:distillery) { |n| "Louisville Distilling Co.#{n}" }
    sequence(:varietal) { |n| "Blended#{n}" }
  end
end

FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "Pablo#{n}" }
    sequence(:email) { |n| "pablo#{n}@user.com" }
    password 'password'
    password_confirmation 'password'
  end
end
