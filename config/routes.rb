Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'pages#index'
  get 'shop', to: 'pages#shop'

  resources :carts
  resources :product_items
  resources :orders
end
