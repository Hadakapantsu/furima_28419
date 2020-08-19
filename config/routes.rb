Rails.application.routes.draw do
  root "users#new"
  # post "index",to "new_user_registration_path#index"

  # new_user_registration_path	GET	/users/sign_up(.:format)
  devise_for :users
  
  resources :users, only: [:index, :new, :create, :edit, :update]
end
