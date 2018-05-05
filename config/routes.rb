Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#home'

  get '/auth/:provider/callback', to: 'sessions#login', as: 'auth_callback'
  get '/auth/amazon', as: 'amazon_login'
  delete '/logout', to: 'sessions#logout', as: 'logout'

  get 'recipes/favorites', to: 'recipes#favorites', as: 'favorite_recipes'
  post 'recipes/:id/add_favorite', to: 'recipes#add_favorite', as: 'add_favorite'
  resources :recipes, only: [:index, :show]
end
