Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "homepage", to: "recipes#homepage"
  get "/recipes", to: "recipes#index", as: "recipes"
  get "/recipes/:id", to:"recipes#show", as: "recipe"
end
