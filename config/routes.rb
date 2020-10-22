Rails.application.routes.draw do
  devise_for :users
  # get 'infomations/index'
  root "cars#index"
  resources :users, only: [:edit, :update]
  resources :cars, only: [:index, :new, :create, :edit, :update, :show] do
    resources :infomations, only: [:index, :new, :create, :edit, :update]
  end
end