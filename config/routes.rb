Rails.application.routes.draw do
  resources :experiences
  devise_for :users
  resources :users, only: [:edit, :update]
  get '/user', to: 'users#show'
  root to: "pages#root"
end
