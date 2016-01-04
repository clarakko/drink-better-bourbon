require 'rails_helper'

FactoryGirl.define do
  factory :bourbon do
    sequence(:name) { |n| "Angel's Envy#{n}" }
    sequence(:proof) { |n| "#{n}" }
    sequence(:distillery) { |n| "Louisville Distilling Co.#{n}" }
    sequence(:varietal) { |n| "Blended#{n}" }
  end
end
