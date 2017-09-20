# frozen_string_literal: true

FactoryGirl.define do
  factory :horse_pedigree do
    horse
    association :sire, factory: :horse
    association :dam, factory: :horse
  end
end
