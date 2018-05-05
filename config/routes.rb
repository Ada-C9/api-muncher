Rails.application.routes.draw do
get '/', to: "recipes#root", as: :root
get '/:query/results', to: "recipes#results", as: :results
get '/:id', to: 'recipes#show', as: :show


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
