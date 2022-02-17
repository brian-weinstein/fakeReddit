Rails.application.routes.draw do
  resources :posts, except: [:index,:create,:new] do
    resources :comments, only: [:new,:create,:show,:edit,:update,:destroy]
  end
  resources :subs do
    resources :posts, only: [:new,:create]
  end
  resources :users, only: [:new,:create]
  resource :session, only: [:new,:create,:destroy]

  root 'subs#index'
end
