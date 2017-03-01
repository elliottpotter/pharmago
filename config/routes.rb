Rails.application.routes.draw do

  authenticated :user do
    root 'customers#show', as: :authenticated_root
  end

  devise_scope :user do
    root to: "users/registrations#new"
  end

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
end

