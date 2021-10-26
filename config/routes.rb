Rails.application.routes.draw do
  root 'home#index'
  get 'quote', to: 'home#quote'
  get 'commercial', to: 'home#commercial'
  get 'residential', to: 'home#residential'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


