Rails.application.routes.draw do
  get 'home/welcome'

  resources :recipes
  get 'users/new'
  post 'users/create'

  get 'users/edit'
  put 'users/update'

  get 'users/forgotten'
  post 'users/send_forgotten'

  get 'users/show'

  resources :recipes
  get 'home/welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
