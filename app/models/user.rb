class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :login
  has_many :document
  has_many :instructions
  has_many :social_accounts
  has_many :wallets
  has_many :subscriptions
  has_many :account_transfers, as: :transferable
end
