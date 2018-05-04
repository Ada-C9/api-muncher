Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "recipes#root"
  post "search" => "recipes#search", as: :search


  get "index" => "recipes#index", as: :index

  # get "recipes#show"
end
