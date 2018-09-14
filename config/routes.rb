Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :products, only: [:show, :index]
  
  root 'products#index'
  
  namespace :admin do
    resources :products
  end
end
