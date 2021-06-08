Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :orders
  resources :carts
  resources :users do
    resources :avatars, only: [:create]
  end

  resources :items

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
    get 'success', to: 'checkout#success', as: 'checkout_success'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
