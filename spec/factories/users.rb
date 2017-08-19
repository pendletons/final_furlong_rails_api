# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    sequence(:name) { |x| "name #{x}" }
    sequence(:username) { |x| "user#{x}" }
    email { "#{username}@domain.com" }
    password { "123456789" }
    password_confirmation { "123456789" }
    sequence(:stable_id)
  end
end
