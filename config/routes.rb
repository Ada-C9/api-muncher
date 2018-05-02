Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#root'

  get 'search', to: 'recipes#index', as: 'search_results'

  get ':recipe/new', to: 'recipes#new', as: 'recipe_new'
  post ':recipe', to: 'recipes#create', as: 'recipe_create'

end
