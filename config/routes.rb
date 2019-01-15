Rails.application.routes.draw do
  resources :meet_up_types
  resources :locations
  resources :meet_ups
  resources :games
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
