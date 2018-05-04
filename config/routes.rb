Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	root 'recipes#search'
  get 'recipes/search', to: 'recipes#search', as: 'search'
  get 'recipes/results', to: 'recipes#results', as: 'results'
	get 'recipes/show', to: 'recipes#show', as: 'show'
end


# root 'chat#index'
# get ':channel/new', to: 'chat#new', as: 'chat_new'
# post ':channel', to: 'chat#create', as: 'chat_create'
