Rails.application.routes.draw do
  root 'home#index'
  get 'home/quote'
  get 'home/commercial'
  get 'home/residential'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end


