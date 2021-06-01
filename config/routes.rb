Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get '/dashboard', to: users#show, as: :dashboard #to show all users cakes/orders
  resources :cakes do
    resources :orders, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
