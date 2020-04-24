Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :public do
    devise_for :users
    get '/items/top'
    resources :items, only: [:index, :show]
    resource :end_users, only: [:index, :update, :destroy, :create]
    delete '/cart_items/destroy_all', to: 'cart_items#destroy_all'
    resources :cart_items
    resources :orders, only: [:new, :index, :create, :show]
    get '/orders/comfirm'
    get '/orders/complete'
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  root '/public/items/top'

  namespace :admin do
    devise_for :users
    get '/top'
    resources :items, only: [:index,:new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :end_users, only:[:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_items, only: [:update]
  end
end
