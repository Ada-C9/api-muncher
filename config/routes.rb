Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#home'

  get '/auth/:provider/callback', to: 'sessions#login', as: 'auth_callback'
  get '/auth/amazon', as: 'amazon_login'
  delete '/logout', to: 'sessions#logout', as: 'logout'
  
  resources :recipes, only: [:index, :show]
end
