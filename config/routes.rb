Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'grub#new'
  get '/recipe', to: 'grub#index', as: 'food_list'
  get '/recipes/:id', to: 'grub#show', as: 'food'
  get '/recipe/new', to: 'grub#new'

end
