Rails.application.routes.draw do
	root 'recipes#search'

	get '/recipes', to: 'recipes#index', as: 'recipes'
	get '/recipe', to: 'recipes#show', as: 'recipe'
end
