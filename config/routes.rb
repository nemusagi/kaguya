Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'top/index'
  root to: 'top#index'
  resources :posts, only: [ :new, :create ]
end
