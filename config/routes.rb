Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'grub#new'
  get '/recipe', to: 'grub#index', as: 'all_food'
  get '/recipe/new', to: 'grub#new', as: 'new_food'
  get '/recipe/:id', to: 'grub#show', as: 'food'

end
