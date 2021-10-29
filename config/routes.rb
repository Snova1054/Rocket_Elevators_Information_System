Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :quotes
  get 'quote', to: 'quotes#new'
  get 'commercial', to: 'home#commercial'
  get 'residential', to: 'home#residential'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end