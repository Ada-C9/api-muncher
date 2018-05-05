Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#root'
  get 'results', to: 'recipes#index', as: 'results'
  get 'recipes/:id', to: 'recipes#show', as: 'recipe'
end
