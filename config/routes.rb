Rails.application.routes.draw do
  resources :subscriptions
  resources :wallets
  root 'transmit#index'
  resources :social_accounts
  resources :instructions
  resources :documents
  resources :transmit
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
