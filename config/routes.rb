Embroideryshop::Application.routes.draw do
  match 'sitemap.xml' => 'sitemaps#sitemap'
  match 'site-map' => 'home#sitemap', :as => :sitemap

  resources :quotes


  resources :product_samples, :except => :show
  match "/sample/:product_id/:id", to: "product_samples#show", :as => :sample
  #match "/productscrumbs/:id", to: "home#samples", :as => :productscrumbs
  


  resources :products


  get "home/index"
  root :to => 'home#index'
  
  
  match "/samples/:id", to: "home#samples", :as => :samples
  #match "/samples", to: "home#samples"
  match "/samples", to: "home#products", :as => :productsamples
  match "/about-us", to: "home#aboutus", :as => :aboutus
  match "/contact-us", to: "home#contactus", :as => :contactus
  match "/how-to-place-order", to: "home#howwework", :as => :howwework
  match "/pricing", to: "home#pricing"
  match "/faqs", to: "home#faqs"
  match "/privacy-policy", to: "home#privacypolicy", :as => :privacypolicy
  
  match "/free-quote", to: "quotes#new", :as => :newquote
  match '*unmatched_route', to: 'home#routing_error'

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
