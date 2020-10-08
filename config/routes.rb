Rails.application.routes.draw do
  get '/'=> 'sessions#welcome'
  # get '/home' => 'static#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  get '/raffles/:id/donations', to: 'donations#raffle_donation'

  resources :users
  resources :donations

  get '/auth/:provider/callback', to: 'sessions#omniauth'
  
  resources :raffles do
     resources :donations
  end
  
  match '/users', to: 'users#index', via: 'get'

end
