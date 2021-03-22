Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "pages#home"


  get "users", to: "registrations#index"
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "pages#new"
  post "sign_in", to: "pages#create" 
  delete "logout", to: "pages#destroy"

  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"
  
  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
end