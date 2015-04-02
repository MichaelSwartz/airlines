Rails.application.routes.draw do
  root 'airlines#index'
  devise_for :users

  resources :airlines do
    resources :reviews
  end

  namespace :admin do
    resources :airlines
    resources :reviews
  end
  resources :reviews do
    resources :upvotes
    resources :downvotes
  end
end
