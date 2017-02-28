Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :order_products, only: [ :index, :show ]
  resources :products, only: [ :index, :show ]
  resources :orders, only: [ :index, :show ]
end
