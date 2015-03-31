Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :reviews, only: [:index, :new, :create, :update, :show]
  resources :airlines
end
