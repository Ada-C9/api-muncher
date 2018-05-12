Rails.application.routes.draw do

root 'recipes#search'

get 'search', action: :index, controller: 'recipes'
get '/recipes', to: 'recipes#index', as: 'recipes'
get '/recipe/:id', to: 'recipes#show', as: 'recipe'

resources :recipe, only: [:index, :show]
end
