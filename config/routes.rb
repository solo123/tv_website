Rails.application.routes.draw do
  resources :homes
  resource :account
  resource :myaccount
  resources :telephones, :emails, :addresses
  resources :pages, :tour_orders
  #resources :tours do
  #  member do
  #    get 'order'
  #    post 'order'
  #  end
  #match 'order' => 'orders#new', :via => :get
  #match 'order' => 'orders#edit', :via => :post
  #match 'prices' => 'orders#prices'
  #end
  resources :orders do
    get 'payment', :on => :member
  end
  resources :pay_credit_cards, :user_infos
end
