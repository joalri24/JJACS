Rails.application.routes.draw do

  get 'vcubs'                       => 'vcubs#index'

  #get 'vcubs/crear'
  post 'vcubs'                      => 'vcubs#crear'

  #get 'vcubs/:id/actualizar'        => 'vcubs#actualizar'
  put 'vcubs/:id'                   => 'vcubs#actualizar'

  get 'vcubs/:id'                   => 'vcubs#mostrar'

  #get 'vcubs/:id/destruir'          => 'vcubs#destruir'
  delete 'vcubs/:id/destruir'       => 'vcubs#destruir'


  get 'tranvias'                    => 'tranvias#index'

  post 'tranvias'                   => 'tranvias#crear'

  put 'tranvias/:id/'                => 'tranvias#actualizar'

  get 'tranvias/:id'                => 'tranvias#mostrar'
  
  delete 'tranvias/:id'             => 'tranvias#destruir'


  get 'mobibuses/crear'

  get 'mobibuses/:id/actualizar'    => 'mobibuses#actualizar'

  get 'mobibuses/:id/destruir'      => 'mobibuses#destruir'

  get 'mobibuses'                   => 'mobibuses#index'

  get 'mobibuses/:id'               => 'mobibuses#mostrar'


  get 'conductores'                 => 'conductores#index'

  get 'conductores/crear'           => 'conductores#crear'

  get 'conductores/:id'             => 'conductores#mostrar'

  get 'conductores/:id/actualizar'  => 'conductores#actualizar'

  get 'conductores/:id/destruir'    => 'conductores#destruir'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'conductores#index'

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
