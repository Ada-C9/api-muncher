Rails.application.routes.draw do
  root 'recipes#new'

  resources 'recipes', only: [:index, :show, :new]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
