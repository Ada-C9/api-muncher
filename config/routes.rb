Rails.application.routes.draw do
  root 'recipes#home'
  get 'recipes#index', to: 'recipes#index', as: 'recipes'
  get 'recipes', to: 'recipes#show', as: 'recipe'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
