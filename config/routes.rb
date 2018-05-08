Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get 'homepage', to: 'homepage#index', as: 'homepage_path'

  # get '/search', to: 'recipe#new', as: 'search_recipe'


  # post '/search-confirmed', to: 'recipe#search', as:'confirmed_search'

  root 'recipe#index'
  get '/search',to: 'recipe#index', as: 'query_results'
  get "/auth/:provider/callback", to: "sessions#create", as: 'auth_callback'
  get 'logout', to:'sessions#destroy', as: 'signout'

  get '/:item', to: 'recipe#show', as: 'recipe_show'

end
