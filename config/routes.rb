Rails.application.routes.draw do
  get 'infomations/index'
  root "infomations#index"
end
