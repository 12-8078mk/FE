Rails.application.routes.draw do
  devise_for :users
  # get 'infomations/index'
  root "infomations#index"
  resources :users, only: [:edit, :update]
end
