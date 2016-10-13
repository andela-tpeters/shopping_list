Rails.application.routes.draw do
  root "landings#index"
  post "/login", to: "sessions#signin"
end
