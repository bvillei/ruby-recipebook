Rails.application.routes.draw do
  match 'sessions/create', to: 'sessions#create', via: :post, as: 'login'
  match 'sessions/destroy', to: 'sessions#destroy', via: [:delete, :get], as: 'logout'

  get 'users/new', to: 'users#new', as: 'register'
  post 'users/create', to: 'users#create', as:'user'

  get 'users/:id/edit', to: 'users#edit', as: 'edit_profile'
  put 'users/:id', to: 'users#update'

  get 'users/:id', to: 'users#show', as: 'profile'

  get 'users/forgotten'
  post 'users/send_forgotten'

  get 'download/:id/:aid', to: 'recipes#download', as: 'download'
  resources :recipes
  get 'home/welcome', as: :welcome

  root to: 'home#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
