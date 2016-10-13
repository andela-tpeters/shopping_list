Rails.application.routes.draw do
  root "landings#index"
  post "/login", to: "sessions#signin"
  get "/user/new", to: "users#new"
  post "/user/create", to: "users#create"
  get "/shopping_lists/new", to: "shopping_lists#new"
  post "/shopping_lists/create", to: 'shopping_lists#create'
  get "/shopping_lists/index", to: 'shopping_lists#index'
  get "/shopping_lists/:id/items/new", to: "items#new", as: :new_item
  post "/shopping_lists/:id/items/create", to: "items#create", as: :create_item
  get "/shopping_lists/:id/items", to: "items#index", as: :items
end
