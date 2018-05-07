Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'recipes#new', as: 'root'

  resources :recipes, only: [:index, :new, :show, :create]

end
