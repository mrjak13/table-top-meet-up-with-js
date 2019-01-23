Rails.application.routes.draw do
 
  # session routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'  

  resources :meet_up_types

  resources :locations do 
    resources :meet_ups, only: [:new, :create]
  end
  
  resources :meet_ups do
    resources :user_meet_ups, only: [:create]
  end

  resources :user_meet_ups, only: [:destroy]

  resources :games do
  	  resources :user_games, only: [:create] 
  	end

  resources :user_games, only: [:update, :destroy]

  resources :users, except: [:create]
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
