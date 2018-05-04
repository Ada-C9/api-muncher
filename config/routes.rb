Rails.application.routes.draw do
  root 'recipe#new'
  get 'recipe/results', to: 'recipe#index', as: 'results'
  get 'recipe/find', to: 'recipe#create', as: 'search'
end
