Rails.application.routes.draw do


#Public
  root to: 'public#index'
  get 'show', to: 'public#show'

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
