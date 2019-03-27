FactoryGirl.define do
  factory :user, aliases: [:author] do
    email { Faker::Internet.email }
    password Faker::Internet.password(10, 20)
    name { Faker::Name.name }

    trait :admin do
      admin true
    end

    factory :admin do
      admin true
    end

    trait :with_articles do
      after(:create) { |user| create_list(:article, 50, author: user) }
    end

    factory :user_with_articles do
      transient do
        articles_count 2
      end

      after(:create) do |user, evaluator|
        create_list(:article, evaluator.articles_count, author: user)
      end
    end
  end
end
