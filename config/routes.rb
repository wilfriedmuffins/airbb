Rails.application.routes.draw do
  

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  resources :logements
  get "search", to: "pages#search"
  get "users", to: "users#index"


  
end