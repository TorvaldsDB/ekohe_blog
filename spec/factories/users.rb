FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password Faker::Internet.password(10, 20)

    trait :admin do
      admin true
    end

    factory :admin do
      admin true
    end
  end
end
