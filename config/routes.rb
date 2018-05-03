Rails.application.routes.draw do

root 'recipes#index'

get 'search', action: :search, controller: 'recipes'
end
