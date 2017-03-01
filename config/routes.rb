Rails.application.routes.draw do
  # devise_for :users
  root to: 'pages#home'
  devise_for :users, :controllers => { :registrations => "registrations/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :order_products, only: [ :index, :show, :new, :create ] do
    resources :products, only: :create
  end
  resources :products, only: [ :index, :show, :new, :create ]
  resources :orders, only: [ :index, :show, :new, :create ]
  resources :customers, only: [ :show]
end

