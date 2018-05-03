Rails.application.routes.draw do

  root 'recipes#home'

  # resources :recipes, only: [:index, :show]

  get '/recipes/', to: 'recipes#index', as: 'recipes'

  get 'recipes/:uri', to: 'recipes#show', as: 'recipe'


end
