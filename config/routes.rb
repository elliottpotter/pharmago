Rails.application.routes.draw do

  get 'subscriptions/create'

  get 'subscriptions/edit'

  get 'subscriptions/update'

  get 'subscriptions/destroy'

  get 'subscriptions/upgrade'

  authenticated :user do
    root :to => 'passthrough#minirouter' # Look up the PassthroughController
  end

  devise_scope :user do
    root to: "users/registrations#new"
  end

  get 'drivers/new',            to: 'driver_registrations#new'
  get 'drivers/switch',         to: 'drivers#switch'
  get 'orders/claim',           to: 'orders#claim'
  post 'drivers',               to: 'driver_registrations#create'
  get 'verification_codes/new', to: 'verification_codes#new'

  devise_for :users, :controllers => { :registrations => "users/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :order_products, only: [ :index, :show, :new, :create ] do
    resources :products, only: :create
  end
  resources :products, only: [ :index, :show, :new, :create ] do
    resources :order_products, only: [ :index, :show, :new, :create ]
  end
  resources :orders, only: [ :index, :show, :new, :create ] do
    resources :order_products, only: [ :index, :show, :new, :create ] do
      resources :products, only: [ :index, :show, :new, :create ]
    end
  end
  resources :customers, only: [ :show]
  resources :drivers, only: [ :show ]
  resources :verification_codes
end


