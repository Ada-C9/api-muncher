Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'grub#new'
  get '/recipe', to: 'grub#index', as: 'grub_list'
  get '/recipes/:uri', to: 'grub#show', as: 'grub'
  get '/recipe/new', to: 'grub#new'

end
