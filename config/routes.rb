Rails.application.routes.draw do
  devise_for :users

  root 'categories#index'

  resources :categories, only: [:index, :new, :create, :show] do
    resources :operations, only: [:index, :new, :create]
  end
  
  resources :operations, only: [:show, :edit, :update, :destroy]

  as :user do
    get 'logout', to: 'devise/sessions#destroy', as: :logout
  end
end
