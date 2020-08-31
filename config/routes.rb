Rails.application.routes.draw do
  
  devise_for :users

  root "items#index"

  resources :users, only: [:new, :create,:edit, :update, :destroy] 
  resources :items, only: [:index, :new, :create, :show ,:edit ,:destroy]
  # resources :items_users
 
end
