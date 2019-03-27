FactoryGirl.define do
  factory :article do
    author

    title { Faker::Book.title }
    content { Faker::Lorem.sentence(5) }
    pubulished false#Faker::Boolean.boolean(0.1)
    published_at nil

    trait :pubulished do
      pubulished true
      published_at { Date.yesterday }
    end
  end
end
