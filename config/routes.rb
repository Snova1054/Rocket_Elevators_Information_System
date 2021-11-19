Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Blazer::Engine, at: "blazer"
  devise_for :users
  root 'home#index'
  resources :home
  resources :quotes
  get 'quote', to: 'quotes#new'
  get 'commercial', to: 'home#commercial'
  get 'residential', to: 'home#residential'
  get 'map', to: 'map#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end