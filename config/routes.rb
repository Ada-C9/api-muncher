  Rails.application.routes.draw do
    root 'recipes#index'
    get 'recipes/search', to: 'recipes#search', as: 'recipes_search'
    get 'recipes/:id', to: 'recipes#show', as: 'recipe_show'
  end
