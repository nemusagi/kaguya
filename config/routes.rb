Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'top/index'
  root to: 'top#index'
  resources :post, only: [ :new, :create ]
end
