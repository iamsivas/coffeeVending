Rails.application.routes.draw do
  root 'home#index'
  
  resources :home

  post '/item_order', to: 'home#order_item'
end
