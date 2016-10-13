Rails.application.routes.draw do
  root "landings#index"
  post "/login", to: "sessions#signin"
  get "/user/new", to: "users#new"
  post "/user/create", to: "users#create"
  get "/shopping_lists/new", to: "shopping_lists#new"
  post "/shopping_lists/create", to: 'shopping_lists#create'
  get "shopping_lists/index", to: 'shopping_lists#index'
end
