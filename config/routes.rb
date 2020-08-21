Rails.application.routes.draw do
  devise_for :users

  root "items#index"
  # post "users#new"

  resources :users
  resources :items
 
end
