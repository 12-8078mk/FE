Rails.application.routes.draw do
  devise_for :users
  # get 'infomations/index'
  # root "cars#index"
  root "infomations#index"
  resources :users, only: [:edit, :update]
  resources :cars, only: [:index, :new, :create, :edit, :update]
end
