Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root 'home#index'

  get 'home/random_result'
  post 'home/review_write'
  get 'home/search'
  get 'home/search_result'
  get 'home/contact'
  get 'home/introduction'
  get 'home/registration'
  get 'home/search_condition'
  post 'home/search_result_store/review_write' => 'home#review_write'
  
  get 'home/condition' => 'home#condition'
  post 'home/write' => 'home#write'
  get 'home/board' => 'home#board'
  get 'home/ask_show/:post_id' => 'home#ask_show'
  get 'home/input_db'
  get 'home/search_result_store/:ssr_id' => 'home#search_result_store'
  get 'home/store_edit/:id' => 'home#store_edit'
  post 'home/store_update/:id' => 'home#store_update'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
end
