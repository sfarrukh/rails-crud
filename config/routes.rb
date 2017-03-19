Rails.application.routes.draw do

#Public
  root to: 'public#index'

#Customers
  get 'account', to: 'account/access#menu'
  get 'account/access/menu'
  get 'account/access/login'
  post 'account/access/attempt_login'
  get 'account/access/logout'

  # get 'account/access/new'
  # post 'account/access/create'

  resources :account do
    resources :actors, :films, only: [:index, :show]
  end

  resources :checkout, only: [:show]
  post 'checkout/create'

  resources :cart, only: [:index, :show] do
    member do
      get :delete
      get :add
      get :subtract
    end
  end

# Admin
  get 'admin', to: 'admin/access#menu'
  get 'admin/access/menu'
  get 'admin/access/login'
  post 'admin/access/attempt_login'
  get 'admin/access/logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :admin do
    resources :actors, :films, :customers, :addresses do
      member do
        get :delete
      end    
    end

  end


# Staff
  get 'staff', to: 'staff/access#menu'
  get 'staff/access/menu'
  get 'staff/access/login'
  post 'staff/access/attempt_login'
  get 'staff/access/logout'
  
  namespace :staff do 
    resources :main, only: [:index]
    resources :actors, :films, only: [:index, :show]

    resources :customers, :addresses do 
      member do
        get :delete
      end
    end
  end

end
