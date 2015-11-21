Rails.application.routes.draw do
  devise_for :users

  #VST
  resources :posts, controller: :posts
  root 'posts#index'
  #get '/posts' => 'posts#index'
  #get '/posts/new' => 'posts#new'
  #post '/posts' => 'posts#create'
  #get '/post/:id' => 'posts#show', as: :post
  #get '/post/:id/edit' => 'posts#edit', as: :edit_post 
  #patch '/post/:id' => 'posts#update'
  #delete  '/post/:id' =>  'posts#destroy'

  resources :comments, controller: :comments, only: [:create, :destroy, :show_user_comments]
  get '/show_user_comments/:id' => 'comments#show_user_comments'

  get 'post/:id/likes', to: 'posts#post_like', as: :likes  

  get 'persons/profile', as: 'user_root'

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
