Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'teddies#index'
  resources :teddies, only: [:index, :show]
  resources :orders, only: [:show, :create] do
    resources :payments, only: :new
  end
end
