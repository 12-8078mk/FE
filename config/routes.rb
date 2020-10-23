Rails.application.routes.draw do
  devise_for :users
  # get 'infomations/index'
  root "cars#index"
  resources :users, only: [:edit, :update]
  resources :cars do
    resources :infomations, only: [:index, :new, :create, :edit, :update]
  end
end