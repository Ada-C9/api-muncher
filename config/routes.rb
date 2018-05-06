Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD

  resources :recipes, only: [:index, :new, :show, :create]

||||||| merged common ancestors
=======

  resources :recipes, only: [:index, :show, :create]

>>>>>>> master
end
