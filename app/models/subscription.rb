class Subscription < ApplicationRecord
  validates :title, :body, :password, :login, :presence => true
  validates :title, :length => { :minimum => 2 }
  validates :title, :uniqueness => { :massage => "Already Taken" }
  has_many :account_transfers, as: :transferable, dependent: :destroy
  belongs_to :user
end
