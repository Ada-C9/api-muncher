Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#search'
  get 'recipes', to: 'recipes#index', as: 'results'
  get 'recipe/:id', to: 'recipes#show', as: 'recipe'

end
