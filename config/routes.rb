Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'edamams#new'
  get '/recipe/new', to: 'edamams#new'
  get '/recipe/index', to: 'edamams#index', as: 'recipe_list'
  get '/recipe/:uri', to: 'edamams#show', as: 'recipe_details'



end
