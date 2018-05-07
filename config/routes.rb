Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#root'

  get '/recipes', to: 'recipes#index', as: 'recipes'

  get '/recipes/:label', to: 'recipes#show', as: "recipe"

  # get ':channel/new', to: 'chat#new', as: 'new_message'
  # post ':channel', to: 'chat#create', as: 'send_message'
end
