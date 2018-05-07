Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#root'

  # get '/', to: 'recipes#root'
  get '/recipes', to: 'recipes#index', as: 'recipes'
  get '/recipe', to: 'recipes#show', as: 'recipe'

  get '/auth/google_oauth2/callback', to: 'sessions#create', as: 'auth_callback'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:show, :edit, :update, :destroy]
  resoureces :favorites, only: [:create, :destroy]
end
