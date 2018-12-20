class User < ApplicationRecord
  attr_accessor :login
  has_one :document
  has_many :instructions
  has_many :social_accounts
  has_many :wallets
  has_many :subscriptions
  has_many :account_transfers, as: :transferable
end
