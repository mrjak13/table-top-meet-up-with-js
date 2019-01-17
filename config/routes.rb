Rails.application.routes.draw do

  # session routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'  

  resources :meet_up_types
  resources :locations
  resources :meet_ups
  resources :games


  resources :users, except: [:new, :create]
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
