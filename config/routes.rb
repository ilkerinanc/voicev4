Voicev4::Application.routes.draw do

  resources :voices

  #get "discussions/index"

  #get "discussions/new"

  #get "discussions/create"

  #get "discussions/update"

  #get "discussions/destroy"

  #get "discussions/show"

  #get "discussions/edit"

  #get "discussion_posts/create"

  #get "discussion_posts/destroy"

  # get "interest_posts/create"

  # get "interest_posts/destroy"

  # get "taggings/create"

  # get "taggings/destroy"

  # get "home/index"

  root :to => "home#index" 

  resources :sessions

  resources :users

  resources :interests

  resources :friendships

  resources :occasions

  resources :discussions
  match 'user/edit' => 'users#edit', :as => :edit_current_user

  match 'signup' => 'users#new', :as => :signup

  match 'logout' => 'sessions#destroy', :as => :logout

  match 'login' => 'sessions#new', :as => :login

  match 'user/pending' => 'friendships#approve', :as => :user_pending_post, :via => :post
  match 'user/pending' => 'users#pending', :as => :user_pending
  match 'user/:user' => 'users#show', :as => :user_show
  match 'user/:user/connections' => 'users#connections', :as => :user_connections
  match 'user/:user/contact' =>'users#contact', :as => :user_contact
  match 'user/:user/about' => 'users#about', :as => :user_about
  match 'user/:user/interests' => 'users#interests', :as => :user_interests

  match 'users' => 'users#index', :as => :users_index

  match 'interests/:interest' => 'interests#show', :as => :interest
  match 'interests/:interest/edit' => 'interests#show', :as => :interest_edit

  match 'subscribe' => 'subscriptions#create', :as => :subscribe, :via => :post
  match 'unsubscribe' => 'subscriptions#destroy', :as => :unsubscribe, :via => :post

  match "tags" => 'tags#index'
  
  match 'missed_occasions' => 'occasions#missed', :as => :missed_occasions
  match 'occasions/:occasion' => 'occasions#show', :as => :occasion
  match 'recommendations' => 'recommendations#index', :as => :recommendations

  match 'auth/:provider/callback', :to => 'sessions#create_with_fb'
  match 'auth/failure', :to => redirect('/')

  # match 'occasions' => 'occasions#index', :as =>:occasions
  # match 'occasions/new' => 'occasions#new', :as =>:new_occasion


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
