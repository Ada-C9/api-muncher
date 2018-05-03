Rails.application.routes.draw do

  root 'search#new'
  get 'index', to: 'search#index', as: 'recipes'
  get ':recipe/show', to: 'search#show', as: 'recipe_show'
  #
  # get 'search/new'
  # get 'search/index'
  # get 'search/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
