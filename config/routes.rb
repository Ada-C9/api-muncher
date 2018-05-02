Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#root'
  get '/search/:input', to: 'recipes#search', as: 'search_results'
  # get '/recipes/:id', to: 'recipes#show', as: 'recipe_show'
end
