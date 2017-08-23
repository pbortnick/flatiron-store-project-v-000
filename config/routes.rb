Rails.application.routes.draw do

  devise_for :users
  root 'store#index', as: 'store'

  resources :items, only: [:show]
  resources :categories, only: [:show]
  resources :carts, only: [:show]
  post '/line_items/:item_id' => 'line_items#create', as: "line_items"
  resources :orders, only: [:show]

end
