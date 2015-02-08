Rails.application.routes.draw do

  root to: "visitors#index"
  get "profile", to: "users#show"

  devise_for :users, controllers: { registrations: "registrations" }
  resources :users
end
