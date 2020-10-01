Rails.application.routes.draw do

  get '/'=> 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  get '/home' => 'static#home'

  get '/raffles/:id/donations', to: 'donations#raffle_donation'
  delete '/logout', to: 'sessions#destroy'

  resources :raffles do
     resources :donations
  end
  resources :users
  match '/users', to: 'users#index', via: 'get'

  
  
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
