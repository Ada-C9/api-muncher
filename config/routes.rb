Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'edamams#root'
  get ':recipe/index', to: 'recipe#index', as: 'recipe_list'
  get ':recipe/show', to: 'recipe#show', as: 'recipe_details'



end
