Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'connect', to: 'places#connect'
  get 'callback', to: 'places#callback'

  resources :places do
    resources :reviews, only: [:new, :create]
    resources :favorites, only: [:create]
  end
end
