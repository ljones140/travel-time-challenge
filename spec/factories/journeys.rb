FactoryGirl.define do
  factory :journey do
    start_time "2015-12-13 18:00:00"

    trait :with_visit do
      after(:create) { |instance| create(:visit, journey: instance) }
    end

  end

end
