Rails.application.routes.draw do

root 'recipes#search'

get 'search', action: :index, controller: 'recipes'
get 'index', to: 'recipes#index'
end
