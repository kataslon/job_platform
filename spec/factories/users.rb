FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password '11111111'

    trait :admin do
      after(:create) { |user| user.add_role(:admin) }
    end

    trait :company_owner do
      after(:create) { |user| user.add_role(:company_owner) }
    end

    trait :manager do
      after(:create) { |user| user.add_role(:manager) }
    end

    trait :applicant do
      after(:create) { |user| user.add_role(:applicant) }
    end
  end
end
