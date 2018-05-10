Rails.application.routes.draw do
get '/', to: "recipes#root", as: :root
get '/:query/results', to: "recipes#results", as: :results
get '/:id', to: 'recipes#show', as: :show


# Google OAuth2
get "/auth/:provider/callback", to: "sessions#create", as: 'auth_callback'
delete '/logout', to: 'sessions#logout', as: 'logout'

resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
