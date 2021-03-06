Rails.application.routes.draw do

  get 'prescriptions/new'

  authenticated :user do
    root :to => 'passthrough#minirouter' # Look up the PassthroughController
  end

  devise_scope :user do
    root to: "users/registrations#new"
  end

  get 'drivers/new',                to: 'driver_registrations#new'
  get 'drivers/switch',             to: 'drivers#switch'
  post 'drivers',                   to: 'driver_registrations#create'
  post 'drivers/verify',            to: 'drivers#verify'

  get 'prescriptions/new',          to: 'prescriptions#new'
  post 'prescriptions/create',       to: 'prescriptions#create'


  get 'orders/claim',               to: 'orders#claim'
  post 'order/add_to_cart',         to: 'orders#add_to_cart'



  devise_for :users, controllers: { registrations: "users/registrations" }
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # resources :order_products, only: [ :index, :show, :new, :create ] do
    #   resources :products, only: :create
    # end

  resources :customers, only: [ :show]
  resources :drivers, only: [ :show ]
  resources :verification_codes
    resources :products, only: [ :index, :show, :new, :create ] do
      resources :order_products, only: [ :index, :show, :new, :create ]
    end
    resources :orders, only: [ :index, :show, :new, :create ] do
      resources :payments, only: [ :create]
      resources :order_products, only: [ :index, :show, :new, :create ] do
        resources :products, only: [ :index, :show, :new, :create ]
      end
    end
    resources :customers, only: [ :show] do
      resources :customer_addresses, only: [ :create]
    end

    resources :drivers, only: [ :show ]
end


