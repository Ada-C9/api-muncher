Rails.application.routes.draw do
get '/', to: "recipes#root", as: :root
get '/results', to: "recipes#results", as: :results
get '/recipes/:id', to: 'recipes#show', as: :show
post '/q=?', to: 'recipes#search', as: :search

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
