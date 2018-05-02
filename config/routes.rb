Rails.application.routes.draw do

  root 'recipes#home'

  get '/recipes', to: 'recipes#index'

  get '/recipes/:label', to: 'recipes#show', as: "recipe"

end
