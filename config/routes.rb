Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :places do
    resources :reviews, only: [:new, :create]
    resources :favorites, only: [:create]
  end
end
