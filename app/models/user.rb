class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #:confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :login
  has_many :document
  has_many :instructions
  has_many :social_accounts
  has_many :wallets
  has_many :subscriptions
  # has_many :account_transfers, as: :transferable
  has_many :transfered_accounts, class_name: 'AccountTransfer', foreign_key: 'transmitter_id'
  has_many :inherited_accounts, class_name: 'AccountTransfer', foreign_key: 'inheritor_id'
end
