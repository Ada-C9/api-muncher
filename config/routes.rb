Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'food#new'
  get ':recipe/new', to: 'food#new', as: 'new_food'
  get ':recipe', to: 'food#create', as: 'search_food'
  get ':recipe/:id', to: 'food#show', as: 'food'

end
