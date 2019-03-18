Rails.application.routes.draw do
  # topページ
  root to: 'tops#index'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
