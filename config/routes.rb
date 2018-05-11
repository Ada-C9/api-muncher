Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "recipes#homepage"

  get "muncher", to: "recipes#homepage", as: "homepage"
  get "recipes", to: "recipes#index", as: "recipes"

  get "display/:recipe_uri", to: "recipes#show", as: "show_recipe"
  get "search", to: "recipes#search", as: "search"
end
