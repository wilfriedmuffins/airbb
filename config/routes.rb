Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  resources :logements do
    resources :comments
  end
  
  #resources :users#, only: [:index, :show]
  resources :bookings
  resources :pages, only: [:show]

  get "search", to: "pages#search"
  post "pages/:id", to: 'pages#show'

  # match '/users', to: 'users#index', via: 'get'
  # match '/users/:id', to: 'users#show', via: 'get'

end