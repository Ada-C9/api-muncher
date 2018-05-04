Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#new'
  get '/recipe', to: 'recipes#index', as: 'all_food'
  get '/recipe/new', to: 'recipes#new', as:
  'new_food'
  get '/recipe/:id', to: 'recipes#show', as: 'food'


end
