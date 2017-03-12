# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    password { "123456789" }
    password_confirmation { "123456789" }

    factory :user_with_auth_token do
      auth_token { SecureRandom.urlsafe_base64 }
      auth_token_created_at { Time.current }
    end
  end
end
