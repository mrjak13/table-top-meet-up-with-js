Rails.application.routes.draw do

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  # resources :sessions, only: [:create]

  resources :meet_up_types
  resources :locations
  resources :meet_ups
  resources :games
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
