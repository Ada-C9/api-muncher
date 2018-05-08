Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#root'

  get 'search', to: 'recipes#index', as: 'search_results'
  get 'recipe/:id', to: 'recipes#show', as: 'recipe'
end
