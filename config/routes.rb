Miracode::Application.routes.draw do  

  root to: "pages#index"
  get "about"       => "pages#about"
  get "promotions"  => "event_categories#index"
  
  resources :messages, only: [:new, :create] 
  get "contact"   => "messages#new"

  resources :prod_categories, only: [:index, :show] do
    resources :products, only: [:show]
  end
  
  resources :blog_categories, only: [:index, :show] do
    resources :articles, only: [:show]
  end 

  resources :event_categories, only: [:index, :show] do
    resources :events, only: [:show]
  end

  namespace :admin do
    root to: "prod_categories#index"

    resources :prod_categories do
      resources :products
    end

    resources :blog_categories do
      resources :articles
    end

    resources :event_categories do
      resources :events
    end    
  end

  devise_for :admins, controllers: { sessions: "admin/sessions" }#, :skip => [:passwords, :registrations] 
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
