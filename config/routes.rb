Rails.application.routes.draw do

  devise_for :users
  root 'store#index', as: 'store'

  resources :items, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :carts
  post '/line_items/:item_id' => 'line_items#create', as: "line_items"
  resources :orders, only: [:show]

end
