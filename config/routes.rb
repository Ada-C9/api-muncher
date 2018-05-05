Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#homepage'

  get '/recipes', to: 'recipes#index', as: 'recipes'
  get '/recipes', to: 'recipes#search', as: 'list_recipe'
  get '/recipes/:uri', to: 'recipes#show', as: 'show_recipe'

end
