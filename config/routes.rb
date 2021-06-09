Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :orders, only: [:index, :show, :create]
  resources :carts, only: [:index]
  resources :users, only: [:show] do 
    resources :avatars, only: [:create]
  end
  post 'create', to: 'orders#create', as: 'create_order'

  resources :items, only: [:index, :show]

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
