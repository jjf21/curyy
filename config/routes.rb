
Rails.application.routes.draw do
  resources :experiences, except: [:index, :show] do
    patch :change_position, on: :member
  end
  resources :skills, except: [:index, :show]
  devise_for :users
  resources :users, only: [:edit, :update]
  resources :cvs, except: [:new] do
    get :export, on: :member
  end

  root to: "pages#root"
end
