# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :accounts, only: :show
    resources :counters, only: %i[show update destroy]
  end
end
