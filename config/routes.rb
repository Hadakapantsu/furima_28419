Rails.application.routes.draw do
  
  devise_for :users

  root "items#index"

  resources :users, only: [:new, :create,:edit, :update, :destroy] 
  resources :items do
    resources :transactions
  end
  resources :addresses
  resources :item_users
 
end
