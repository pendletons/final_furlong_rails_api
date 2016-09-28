require_relative '../lib/api_constraints'

Rails.application.routes.draw do
  # devise_for :users
  namespace :api, defaults: { format: :json },
                  constraints: { subdomain: 'api' },
                  path: '/' do
    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: true) do
      devise_for :users
      resources :users, only: [:create, :show, :update, :destroy]
      resources :sessions, only: [:create]
    end
  end
end
