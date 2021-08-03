Rails.application.routes.draw do
  resources :prototypes do
    resources :comments, only: :create
  end
  devise_for :users
  root to: 'prototypes#index'
  resources :users, only: [:edit, :update, :show]
  resources :prototypes, only: [:index, :create, :new, :show, :edit, :update, :destroy]
end
