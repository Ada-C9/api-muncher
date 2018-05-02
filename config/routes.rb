Rails.application.routes.draw do

  root to: "recipes#search"
  get 'recipes/index', to: 'recipes#index', as: 'recipes'
  get 'recipes/show', to: 'recipes#show', as: 'recipe'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
