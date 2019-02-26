Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :subscriptions
  resources :wallets
  root 'transmit#index'
  resources :social_accounts
  resources :instructions
  resources :documents
  resources :transmit
  resources :obtain
  resources :invites
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
