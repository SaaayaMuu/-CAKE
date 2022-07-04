Rails.application.routes.draw do
  

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}




  root to: "public/homes#top"
  get '/about', to: 'public/homes#about'

  scope module: :public do
    get '/customers/my_page', to: 'customers#show'
    get '/customers/unsubscribe' => 'customers#unsubscribe' 
    patch '/customers/withdraw' => 'customers#withdraw'
    
    resource :customers, only:[:edit, :update]
    resources :items, only: [:index, :show]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    delete :cart_items, to: 'cart_items#destroy_all'
    resources :orders, only: [:new, :comfirm, :thanks, :index, :show, :create]
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    get '/' => 'homes#top'
    resources :items, only: [:new, :create, :show, :edit, :update, :index, :destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
  end
  


# ↑skip オプションを使用し不要なルーティングを削除

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

  
end

#new_customer_session GET    /customers/sign_in(.:format)            public/sessions#new
#customer_session POST   /customers/sign_in(.:format)                public/sessions#create
#destroy_customer_session DELETE /customers/sign_out(.:format)       public/sessions#destroy
#new_customer_registration GET    /customers/sign_up(.:format)       public/registrations#new
#edit_customer_registration GET    /customers/edit(.:format)         public/registrations#update
#PUT    /customers(.:format)                                         public/registrations#update
#DELETE /customers(.:format)                                         public/registrations#destroy
#POST   /customers(.:format)                                         public/registrations#create

#customers_unsubscribe GET    /customers/unsubscribe(.:format)       customers#unsubscribe
#mypage GET    /customers/my_page(.:format)                          customers#show
#edit_customer GET    /customer/edit(.:format)                       customers#edit

#root GET                     /                                      public/homes#top
#about GET    /about(.:format)                                       homes#about

#items GET    /items(.:format)                                      　items#index
#item GET    /items/:id(.:format)                                  　 items#show

#customers_my_page GET    /customers/my_page(.:format)                customers#show
#customers_unsubscribe GET    /customers/unsubscribe(.:format)        customers#unsubscribe
#customers_withdraw PATCH  /customers/withdraw(.:format)              customers#withdraw
#edit_customers GET    /customers/edit(.:format)                        customers#edit
#customers PATCH  /customers(.:format)                                  customers#update
#              PUT    /customers(.:format)                             customers#update

#cart_items GET    /cart_items(.:format)                              cart_items#index
#           POST   /cart_items(.:format)                              cart_items#create
#cart_item PATCH   /cart_items/:id(.:format)                          cart_items#update
# =>        PUT    /cart_items/:id(.:format)                          cart_items#update
#DELETE 　　　　　/cart_items/:id(.:format)                           cart_items#destroy

#orders GET    /orders(.:format)                                      orders#index
#POST   /orders(.:format)                                             orders#create
#new_order GET    /orders/new(.:format)                               orders#new
#order GET    /orders/:id(.:format)                                   orders#show

#addresses GET    /addresses(.:format)                                addresses#index
#POST   /addresses(.:format)                                          addresses#create
#edit_address GET    /addresses/:id/edit(.:format)                    addresses#edit
#address PATCH  /addresses/:id(.:format)                              addresses#update
#PUT    /addresses/:id(.:format)                                      addresses#update
#DELETE /addresses/:id(.:format)                                      addresses#destroy


#new_admin_session GET    /admin/sign_in(.:format)                   admin/sessions#new
#admin_session POST   /admin/sign_in(.:format)                       admin/sessions#create
#destroy_admin_session DELETE /admin/sign_out(.:format)              admin/sessions#destroy
#admin GET  /admin(.:format)                                         admin/homes#top

#admin_items GET    /admin/items(.:format)                           admin/items#index
#new_admin_item GET    /admin/items/new(.:format)                   admin/items#new
#edit_admin_item GET    /admin/items/edit(.:format)                 admin/items#edit
#admin_itemGET    /admin/items(.:format)                             admin/items#show
#admin_itemPATCH  /admin/items(.:format)                             admin/items#update
#admin_itemPUT    /admin/items(.:format)                             admin/items#update
#POST   /admin/items(.:format)                                       admin/items#create
#admin_genres GET    /admin/genres(.:format)                         admin/genres#index
#POST   /admin/genres(.:format)                                      admin/genres#create
#edit_admin_genre GET    /admin/genres/:id/edit(.:format)            admin/genres#edit
#admin_genre PATCH  /admin/genres/:id(.:format)                      admin/genres#update
#PUT    /admin/genres/:id(.:format)                                  admin/genres#update
#admin_customers GET    /admin/customers(.:format)                   admin/customers#index
#edit_admin_customer GET    /admin/customers/:id/edit(.:format)      admin/customers#edit
#admin_customer GET    /admin/customers/:id(.:format)                admin/customers#show
#PATCH  /admin/customers/:id(.:format)                               admin/customers#update
#PUT    /admin/customers/:id(.:format)                               admin/customers#update