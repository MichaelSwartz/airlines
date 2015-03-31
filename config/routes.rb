Rails.application.routes.draw do
  root 'airlines#index'
  devise_for :users

  resources :reviews, only: [:index, :new, :create, :update, :show]
  resources :airlines
end
