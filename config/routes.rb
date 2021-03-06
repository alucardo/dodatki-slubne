Rails.application.routes.draw do

  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
  mount Spree::Core::Engine, :at => '/'
          # The priority is based upon order of creation: first created -> highest priority.

  Spree::Core::Engine.add_routes do
    namespace :admin do
      resources :pages
    end
    get "/kontakt", to: "pages#contact", as: :contact
    post "/kontakt", to: "pages#contact_send", as: :contact_send
    get "/page/:slug", to: "pages#show"
  end
end
