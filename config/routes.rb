# frozen_string_literal: true
require_relative "../lib/api_constraints"

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json },
                  constraints: { subdomain: "api" },
                  path: "/" do
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do
      post "/sign_in" => "sessions#create"
      delete "/sign_out" => "sessions#destroy"
      resources :users
    end
  end
end
