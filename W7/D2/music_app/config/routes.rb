Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]

  resource :sessions, only: [:new, :create, :destroy]

  resources :bands

  root to: 'users#index'
end
