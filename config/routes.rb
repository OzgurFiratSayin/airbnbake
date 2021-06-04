Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'users#dashboard', as: :dashboard #to show all users cakes/orders
  get '/search' => 'pages#search', :as => 'search_page'
  resources :cakes do
    resources :orders, only: [:new, :create]
  end
  resources :orders, only: [] do
    resources :reviews, only: [:new,:create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update]
end
