Rails.application.routes.draw do
  resources :posts, except: [:index] do
    resources :comments, only: [:new,:create]
  end
  resources :subs
  resources :users, only: [:new,:create]
  resource :session, only: [:new,:create,:destroy]

  root 'subs#index'
end
