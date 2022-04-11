
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

  get '/coloris_test', to: 'pages#coloris_test'
  get '/coloris', to: 'pages#coloris'
  root to: "pages#root"
end
