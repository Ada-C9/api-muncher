Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "recipes#root"

  # resources :recipes, only: [:index, :show]
  get "/recipes", to: "recipes#index", as: "query_recipe"
  get "/recipes/:label", to: "recipe#show", as: "recipe"
end
