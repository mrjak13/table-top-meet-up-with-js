Rails.application.routes.draw do

  # welcome page
  root 'welcome#index'

  # google omniauth route
  get '/auth/google_oauth2/callback' => 'sessions#create'
 
  # session routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'  

  # user routes
  resources :users, except: [:create]

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  # meet up type routes
  resources :meet_up_types

  # join tables routes
  resources :user_meet_ups, only: [:destroy]

  resources :user_games, only: [:update, :destroy]

  # nested routes
  resources :locations do 
    resources :meet_ups, only: [:new, :create]
  end

  resources :users do
    resources :games, only: [:index]
  end
  
  # nested routes for join tables
  resources :meet_ups do
    resources :user_meet_ups, only: [:create]
  end

  resources :games do
      resources :user_games, only: [:create] 
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
