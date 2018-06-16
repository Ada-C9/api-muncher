Rails.application.routes.draw do
  root 'recipe#new'
  get 'recipe/results', to: 'recipe#index', as: 'results'
  get 'recipe/show', to: 'recipe#show', as: 'show'
end
