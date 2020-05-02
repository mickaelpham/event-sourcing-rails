# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :counters, only: [:show, :update, :destroy]
  end
end
