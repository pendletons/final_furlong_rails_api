# frozen_string_literal: true

FactoryGirl.define do
  factory :horse do
    sequence(:name) { |x| "name #{x}" }
    sequence(:game_id)
    status_id 1

    trait :with_pedigree do
      after(:create) do |horse|
        create(:horse_pedigree, horse: horse)
      end
    end
  end
end
