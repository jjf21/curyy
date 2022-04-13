# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :themes
    resources :cvs
    resources :users

    root to: "users#index"
  end

  resources :experiences, except: [:index, :show] do
    patch :change_position, on: :member
  end

  resources :skills, except: [:index, :show]
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :cvs, except: [:new] do
    get :export, on: :member
  end

  # Static pages
  root to: "pages#root"
  get "/terms", to: "pages#terms"
  get "/contact", to: "pages#contact"
  get "/legal_notices", to: "pages#legal_notices"
  get "/services", to: "pages#services"
  get "/privacy_policy", to: "pages#privacy_policy"
end
