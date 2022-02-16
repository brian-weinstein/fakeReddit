Rails.application.routes.draw do
  resources :subs
  resources :users, only: [:new,:create]
  resource :session, only: [:new,:create,:destroy]

  root 'subs#index'
end
