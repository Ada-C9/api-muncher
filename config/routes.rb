Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	# root '/'
	root 'recipes#search'
	resources :recipes, only: [:index, :show]

	get '/', to: 'recipes#search', as: 'search'
end
