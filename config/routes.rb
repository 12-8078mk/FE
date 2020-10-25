Rails.application.routes.draw do
  get 'graph/index'
  devise_for :users
  # get 'infomations/index'
  root "cars#index"
  resources :users, only: [:edit, :update]
  resources :cars do
    resources :infomations, only: [:index, :new, :create, :edit, :update]
    resources :graphs, only: [:index]
  end
end