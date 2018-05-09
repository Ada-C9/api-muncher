Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "recipes#root"
  post "search", to: "recipes#search", as: :search


  get "index", to: "recipes#index", as: :index

  get "show", to: "recipes#show", as: :recipe

end
