# frozen_string_literal: true

require_relative "../lib/api_constraints"

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json }, path: "/" do
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do
      post "/sign_in" => "sessions#create"
      resources :users, only: [:show]
      resources :horses, only: [:show]
    end
  end

  match "*path" => "errors#show", via: :all
end
