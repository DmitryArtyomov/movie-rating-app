Rails.application.routes.draw do
  devise_for :users
  root to: 'movies#index'

  resources :movies, only: %i[index show]
  resources :reviews, only: %i[create edit update destroy]
  resources :profiles, only: %i[show]
end
