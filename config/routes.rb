Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
    
  resources :searches, only: :index

  resources :airlines do
    resources :reviews
  end

  namespace :admin do
    resources :airlines
    resources :reviews
    resources :users
  end

  resources :reviews do
    resources :upvotes
    resources :downvotes
  end
end
