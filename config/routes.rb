Rails.application.routes.draw do
  devise_for :users

  root "items#index"
  # post "users#new"

  resources :users, only: [:index, :new, :create, :edit, :update]
  resources :items
 
end
