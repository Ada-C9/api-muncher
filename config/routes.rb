Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#index'
  get ':recipe/new', to: 'recipes#new', as: 'new_recipes'
  get ':recipe', to: 'recipes#show', as: 'show_recipes'
  post ':recipe', to: 'recipe#create', as: 'send_recipe'

end
