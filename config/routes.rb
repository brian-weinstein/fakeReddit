Rails.application.routes.draw do
  resources :comments, only: [:show,:create]
  resources :posts, except: [:index] do
    resources :comments, only: [:new]
  end
  resources :subs
  resources :users, only: [:new,:create]
  resource :session, only: [:new,:create,:destroy]

  root 'subs#index'
end
