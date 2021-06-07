Rails.application.routes.draw do
  root 'items#index'
  resources :orders
  resources :carts
  resources :users
  resources :items


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
