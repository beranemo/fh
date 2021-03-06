Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :products, only: [:show, :index]
  
#  resource :cart, only:[:show, :destroy] do
#    collection do
#      #add_cart POST   /cart/add/:id(.:format)  carts#add
#      post :add, path: 'add/:id'
#    end
#  end
  
  resources :products do
    member do
      post :add_to_cart
      post :remove_from_cart
      post :adjust_item
    end
  end
  
  resource :cart
  resources :orders
  
#  root 'products#index'
  
  namespace :admin do
    resources :products
  end
  
  root 'pages#index'

end
