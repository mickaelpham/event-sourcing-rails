# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :accounts, only: :show do
      resources :transactions, only: %i[index create]
    end

    resources :counters, only: %i[show update destroy]
  end
end
