Rails.application.routes.draw do
  get 'blogs/index'

  get 'blogs/new'

  get 'blogs/edit'

  get 'blogs/confirm'

  root to: 'tops#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
end
