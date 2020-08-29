Rails.application.routes.draw do
  
  devise_for :users

  root "items#index"

  resources :users, only: 
  resources :items, only: 
  # resources :items_users
 
end
