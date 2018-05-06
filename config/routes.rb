Rails.application.routes.draw do

  root 'recipes#search'

  resources :recipes, only: [:index]

  get 'recipes/search', to: 'recipes#search', as: 'recipes_search'
  get 'recipes/detail', to: 'recipes#detail', as: 'recipes_detail'

  resources :recipes, only: [:index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
