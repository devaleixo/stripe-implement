Rails.application.routes.draw do
  get 'orders/show'
  get 'orders/create'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'teddies#index'
  resources :teddies, only: [:index, :show]
end
