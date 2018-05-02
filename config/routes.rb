Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :recipes, only: [:show]

  post '/recipes/:terms', to: 'recipes#index', as: :index
  get '/search', to: 'recipes#search', as: :search

end
