Rails.application.routes.draw do
  root 'recipe#root'

  get 'recipes', to: 'recipe#index', as: 'recipes'
  
  get 'recipe/:recipe', to: 'recipe#show', as: 'recipe'
end
