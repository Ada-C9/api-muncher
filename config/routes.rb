Rails.application.routes.draw do
  
  get "/recipes/:id", to: 'recipes#show', as: "recipe"
  get "/recipes", to: 'recipes#index', as: "recipes"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
