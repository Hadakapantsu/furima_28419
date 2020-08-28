Rails.application.routes.draw do
  
  devise_for :users

  root "items#index"

  resources :users, only: [:new, :create,:edit, :update] 
  resources :items, only: [:index, :new, :create, :show]
  # resources :items_users
 
end
