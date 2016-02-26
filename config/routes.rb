Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  # root 'users#login'
  root 'homes#index'
  resources :homes do
  collection do
    get  'search_by_category'
    get  'search_box'
  end
end
  resources :products
  resources :users do
    collection do
      # get url
      get  'login'
      get  'logout'
      get  'register'
      get  'authenticate'
      get  'profile'



      #post url
      post 'authenticate'
      post 'create_user'

    end
  end

  resources :comments do
    collection do
      # get url
      get 'comment_lists'




      #post url
      post 'save_comments'


    end
  end

  resources :categories do
    collection do
      # get url
      get 'delete_category'

      #post url
      post 'delete_all_category'


    end
  end

  resources :maps do
    collection do
      # get url

      #post url
      post 'get_user_coordinates'


    end
  end
end
