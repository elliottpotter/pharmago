Rails.application.routes.draw do
  # devise_for :users
  root to: 'pages#home'
  devise_for :users, :controllers => { :registrations => "registrations/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :order_products, only: [ :index, :show, :new, :create ] do
    resources :products, only: :create
  end
  resources :products, only: [ :index, :show, :new, :create ]
  resources :orders, only: [ :index, :show, :new, :create ] do
=======
  resources :order_products, only: [ :index, :show ]
  resources :products, only: [ :index, :show ]
<<<<<<< HEAD
  resources :orders, only: [ :index, :show ]
  resources :customers, only: [ :show]
=======
  resources :orders, only: [ :index, :show ] do
>>>>>>> 6b39c75480e556e71b795805be004da2f25a2ce3
    resources :order_products, only: :create
  end
>>>>>>> ba3cbc4f9fadc2e384ce1ac6a695a64b9fa6e4ea
end

