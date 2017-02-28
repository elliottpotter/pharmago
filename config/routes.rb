Rails.application.routes.draw do
  # devise_for :users
  root to: 'pages#home'
  devise_for :users, :controllers => { :registrations => "registrations/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :order_products, only: [ :index, :show ]
  resources :products, only: [ :index, :show ]
  resources :orders, only: [ :index, :show ] do
    resources :order_products, only: :create
  end
end
