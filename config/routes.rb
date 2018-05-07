Rails.application.routes.draw do
  root 'recipes#home'
  # get 'recipes/index'
  # get 'recipes/new'
  # get 'recipes/create'
  # get 'recipes/show'
  resources :recipes, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
