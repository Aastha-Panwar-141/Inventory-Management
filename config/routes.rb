Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/new'
  # get 'users/show'
  # get 'users/create'
  # get 'users/update'
  # get 'users/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  # get '/search/:name'=>'products#search'
  
  
  resources :users do
    member do
      get :recommended_products
    end
  end

  resources :products do 
    collection do
      get :search
      get :search_by_brand_name
    end
  end
  
  resources :users
  resources :products
  resources :product_variants
  resources :carts
  
  # get 'products/search' to: 'products#search'
  
end
