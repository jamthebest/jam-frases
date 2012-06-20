Frases::Application.routes.draw do
  get "notifications/index"

  get "notifications/create"

  get "notifications/new"

  get "notifications/update"

  get "notifications/edit"

  get "notifications/show"

  get "notifications/destroy"

  get "reviews/index"

  get "reviews/create"

  get "reviews/new"

  get "reviews/update"

  get "reviews/edit"

  get "reviews/show"

  get "reviews/destroy"

  get "comments/index"

  get "comments/create"

  get "comments/new"

  get "comments/update"

  get "comments/edit"

  get "comments/show"

  get "comments/destroy"

  get "users/index"

  get "users/create"

  get "users/new"

  get "users/update"

  get "users/edit"

  get "users/show"

  get "users/destroy"

  get "tasks/index"

  get "tasks/create"

  get "tasks/new"

  get "tasks/update"

  get "tasks/edit"

  get "tasks/show"

  get "tasks/destroy"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
