Rails.application.routes.draw do
  resources :experiences
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :cvs do
    get :export, on: :member
  end
  root to: "pages#root"

end
