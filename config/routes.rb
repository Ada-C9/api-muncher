Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#home'

  # path for all the recipes
  get '/recipes', to: 'recipes#index', as: 'recipes'

  # path for showing details of a recipe
  get '/recipes/:uri', to: 'recipes#show', as: 'recipe'
end
