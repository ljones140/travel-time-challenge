FactoryGirl.define do
  factory :journey do

    trait :with_visit do
      after(:create) { |instance| create(:visit, journey: instance) }
    end

  end

end
