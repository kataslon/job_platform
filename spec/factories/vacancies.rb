FactoryGirl.define do
  factory :vacancy do
    company_id 1
    deadline { Faker::Date.between(2.days.ago, 20.days.from_now) }
    speciality_id 1
    relevance true
  end
end
