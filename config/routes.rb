Rails.application.routes.draw do
  root 'airlines#index'
  devise_for :users

  resources :airlines do
    resources :reviews, only: [:index, :new, :create, :update, :show]
  end
end
