Rails.application.routes.draw do
	root 'recipes#search'
  get 'recipes/', to: 'recipes#search', as: 'search'
  get 'recipes/results', to: 'recipes#results', as: 'results'
	get 'recipes/show', to: 'recipes#show', as: 'show'
end
