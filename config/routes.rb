Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  get 'top/index'
  root to: 'top#index'
  resources :posts, only: [ :new, :create, :show, :edit, :update, :destroy ] do
    resource :favorites, only: [ :create, :destroy ]
  end
    
  resources :users, only: :show do
    resources :favorites, only: [ :index ]
  end
end
