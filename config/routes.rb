Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  scope '(:locale)', locale: /en|zh-TW/ do
    root "pages#index"
    get "about"       => "pages#about"
    get "promotions"  => "event_categories#index"
    get "test"        => "pages#notify"
    get "search_product"      => "products#index"
    get "search_article"      => "articles#index"
    get "search_event"        => "events#index"

    resources :users

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

    resources :comments, :notifications, :atm_payment_infos
    resources :orders, path_names: { new: 'checkout' }
    resources :carts, only: [:index]
    resources :order_items, only: [:create, :update, :destroy]
  end

  namespace :admin do
    root to: "orders#index"

    resources :prod_categories do
      resources :products
    end

    resources :blog_categories do
      resources :articles
    end

    resources :event_categories do
      resources :events
    end

    resources :company_profiles, :home_pages, :users, :orders
    resources :terms_of_services, :comments, :company_infos
  end

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
