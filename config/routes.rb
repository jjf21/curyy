Rails.application.routes.draw do
  resources :experiences, except: [:index, :show]
  resources :skills, except: [:index, :show]
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :cvs do
    get :export, on: :member
  end
  root to: "pages#root"
end
