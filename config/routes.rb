Rails.application.routes.draw do
  resources :posts, except: [:index]
  resources :subs
  resources :users, only: [:new,:create]
  resource :session, only: [:new,:create,:destroy]

  root 'subs#index'
end
