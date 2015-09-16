Rails.application.routes.draw do

  devise_for :users
  root 'dashboard#index'

  resources :blogs

  resources :posts

  get 'blogs/:id/posts/:post_id', to: 'blogs#show', as: :blog_post

  get '/', to: 'dashboard#index', as: :dashboard

  get 'search', to: 'posts#search_tag', as: :search_tag
  get 'tagged/:tag', to: 'posts#search_tag', as: :tag

  post 'like/:post_id', to: 'likes#create', as: :like_post
  delete 'like/:post_id', to: 'likes#destroy', as: :unlike_post

  post 'follow/:blog_id', to: 'follows#create', as: :follow
  delete 'unfollow/:blog_id', to: 'follows#destroy', as: :unfollow

  resources :texts
  resources :photos

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
