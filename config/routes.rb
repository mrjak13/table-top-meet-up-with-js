Rails.application.routes.draw do
 
  get 'user_meet_ups/create'
  get 'user_meet_ups/update'
  get 'user_meet_ups/destroy'
  # session routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'  

  resources :meet_up_types

  resources :locations do 
    resources :meet_ups, only: [:new, :create]
  end
  
  resources :meet_ups do
    resources :user_meet_ups, only: [:create, :update, :destroy]
  end

  resources :games do
  	  resources :user_games, only: [:create, :update, :destroy] 
  	end

  resources :users, except: [:new, :create]
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
