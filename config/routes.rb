Rails.application.routes.draw do
  root 'recipes#root'

  resources :recipes, only: [:index, :show]
end
