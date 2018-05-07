Rails.application.routes.draw do

  root 'search#new'
  get 'search/index', to: 'search#index', as: 'recipes'
  get 'search/:id/show', to: 'search#show', as: 'recipe'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
