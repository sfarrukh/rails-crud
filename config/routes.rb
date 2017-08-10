Rails.application.routes.draw do

#Public
  root to: 'public#index'
  get 'public/letter'
  get 'public/search'

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

  resources :checkout, only: [:new]
  post 'checkout/create'
  post 'rental/create'

  resources :rental_pendings

  resources :rentals

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
  get 'admin/actors/search'
  get 'admin/actors/letter'
  
  get 'admin/customers/search'
  get 'admin/customers/letter'

  get 'admin/films/search'
  get 'admin/films/letter'

  namespace :admin do
    resources :films, :customers, :addresses do
      member do
        get :delete
      end    
    end

    resources :actors do
      member do
        get :delete
        get :films
        post :unlink
        post :link
      end
    end
  end
  
  # post 'admin/actors/:id/unlink/:film_id'


# Staff
  get 'staff', to: 'staff/access#menu'
  get 'staff/access/menu'
  get 'staff/access/login'
  post 'staff/access/attempt_login'
  get 'staff/access/logout'
  
  namespace :staff do 
    resources :main, only: [:index]
    resources :actors, :films, only: [:index, :show]
    resources :orders

    resources :customers, :addresses do 
      member do
        get :delete
      end
    end
  end

# API
  # namespace :api do
  #   resources :actors, :films, :customers, :addresses
  # end

  namespace :api do
    resources :actors do
      get :films
      get :unlink
      get :link
    end

    resources :films do
      get :actors
    end 

    resources :customers, :addresses
  end

  get 'api/search/films'
  get 'api/search/films_letter'
  get 'api/search/actors'
  get 'api/search/actors_letter'

end
