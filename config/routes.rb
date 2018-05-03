Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#index'
  get '/recipes/show', to: 'recipes#show', as: 'recipe'

end
