FactoryGirl.define do
  factory :journey do
    start_time "2015-12-13 18:00:00"

    trait :with_two_visits do
      after(:create) { |instance| create_list(:visit, 2, journey: instance) }
    end

  end

end
