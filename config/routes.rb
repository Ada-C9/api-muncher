Rails.application.routes.draw do

  root 'recipes#home'

  resources :recipes, only: [:index, :show]


end
