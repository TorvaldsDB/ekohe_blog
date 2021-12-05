# frozen_string_literal: true

FactoryGirl.define do
  factory :article do
    author

    title { Faker::Book.title }
    content { Faker::Lorem.sentence(15) }
    published false # Faker::Boolean.boolean(0.1)
    published_at nil

    trait :published do
      published true
      published_at { Date.yesterday }
    end
  end
end
