Rails.application.routes.draw do
  
  resources :raffles do 
    resources :donations 
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
