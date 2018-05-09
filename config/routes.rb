Rails.application.routes.draw do

  root 'recipes#new'
  get 'recipes/new', to: 'recipes#new', as: 'recipe_search'
  get 'recipes/:id/show', to: 'recipes#show', as: 'recipe_show'
  get 'recipes/index', to: 'recipes#index', as: 'recipe_results'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
