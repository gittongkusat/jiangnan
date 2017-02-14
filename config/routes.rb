Rails.application.routes.draw do
  root 'welcome#index'
  namespace :admin do
    resources :products
  end

    resources :products do
      member do
        post :add_to_cart
      end
    end

  devise_for :users
  root 'welcome#index'
  resources :cart_items

   resources :carts do
    collection do
      delete :clean
       post :checkout
    end
  end
  
  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   namespace :account do
    resources :orders
  end
end
