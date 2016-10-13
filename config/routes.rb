Rails.application.routes.draw do
  root "landings#index"
  post "/login", to: "sessions#signin"
  get "/user/new", to: "users#new"
  post "/user/create", to: "users#create"
  get "/shopping_list/new", to: "shopping_lists#new"
end
