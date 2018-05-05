Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'recipes#main'
    get '/recipes', to: 'recipes#index', as: 'recipes'
    get '/recipes/:uri', to: 'recipes#show', as: 'recipe'
end
