Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "recipes#search"
  post "search" => "recipes#search", as: :search


  # get "recipes#index"

  # get "recipes#show"
end
