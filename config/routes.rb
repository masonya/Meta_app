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

  resources :account_transfers do
    member do
      put :accept_document
      delete :unaccept_document
      put :accept_social_account
      delete :unaccept_social_account
      put :accept_wallet
      delete :unaccept_wallet
      put :accept_subscription
      delete :unaccept_subscription
      put :accept_instruction
      delete :unaccept_instruction
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
