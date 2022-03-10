Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:index, :show]
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  resources :logements 
  resources :comments
  
  #resources :users#, only: [:index, :show]
  resources :bookings
  resources :pages, only: [:show]

  get "guadeloupe",to: "pages#guadeloupe"
  get "paris",to: "pages#paris"
  get "san_francisco",to: "pages#san_francisco"
  get "new_york",to: "pages#new_york"
  get "barcelone",to: "pages#barcelone"

  get "search", to: "pages#search"
  post "pages/:id", to: 'pages#show'
  post "logements/:id", to: 'logements#show'
  # match '/users', to: 'users#index', via: 'get'
  # match '/users/:id', to: 'users#show', via: 'get'

end