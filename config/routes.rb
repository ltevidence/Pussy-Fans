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
  scope '/order' do
    post 'create', to: 'order#create', as: 'order_create'
    get 'cancel', to: 'order#cancel', as: 'order_cancel'
    get 'success', to: 'order#success', as: 'order_success'
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
