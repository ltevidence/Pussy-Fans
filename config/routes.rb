Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :contacts, only: [:create, :new]
  get 'static_pages/about'
  root 'items#index'
  resources :item_carts, only: [:index, :show, :create]
  resources :carts, only: [:index]
  resources :users, only: [:show], path: :mon_profil do 
    resources :avatars, only: [:create]
  end
  post 'create', to: 'item_carts#create', as: 'create_item_cart'

  resources :items, only: [:index, :show], path: :potit_chat

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
