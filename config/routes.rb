Rails.application.routes.draw do
  match 'sessions/create', to: 'sessions#create', via: :post, as: 'login'
  match 'sessions/destroy', to: 'sessions#destroy', via: [:delete, :get], as: 'logout'

  get 'home/welcome'

  get 'users/new', to: 'users#new', as: 'register'
  post 'users/create'

  get 'users/edit/:id', to: 'users#edit', as: 'edit_profile'
  put 'users/update/:id', to: 'users#update', as: 'update_profile'

  get 'users/forgotten'
  post 'users/send_forgotten'

  get 'users/show/:id', to: 'users#show', as: 'profile'

  resources :recipes
  get 'home/welcome', as: :welcome

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
