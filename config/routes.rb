Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#index'
  get ':ingredient/new', to: 'recipes#new', as: 'new_recipes'
  post ':ingredient', to: 'recipes#show', as: 'show_recipes'

end
