Rails.application.routes.draw do
  # resources :account_transfers
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
  #resources :account_transfers

  resources :account_transfers do
    member do
      put :accept
    end
  end

  resources :account_transfers do
    member do
      delete :unaccept
    end
  end


  # resources :social_accounts do
  #   resources :account_transfers
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
