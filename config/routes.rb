Rails.application.routes.draw do
  devise_for :end_users, controllers:{
    registrations: 'end_users/registrations',
    sessions: 'end_users/sessions'
  }
  devise_for :admin, controllers:{
    sessions: 'admins/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :public do
    get '/items/top'
    resources :items, only: [:index, :show]
    resource :end_users, only: [:update, :create, :edit]
    get '/end_users', to: 'end_users#show'
    get '/end_users/confirm', to: 'end_users#confirm'
    delete '/end_users', to: 'end_users#withdraw', as: "withdraw_end_users"
    delete '/cart_items/destroy_all', to: 'cart_items#destroy_all', as: "cart_items_destroy_all"
    resources :cart_items, only: [:index, :update, :create, :destroy]
    get '/orders/complete'
    post '/orders/confirm'
    resources :orders, only: [:new, :index, :create, :show]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  root 'public/items#top'

  namespace :admin do
    get '/top', to: 'top#top'
    resources :items, only: [:index,:new, :create, :show, :edit, :update]
    resources :genres, only:[:index, :create, :edit, :update]
    resources :end_users, only:[:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    patch '/orders/detail_update/:id', to: 'orders#detail_update', as: 'orders_detail_update'
  end
end
