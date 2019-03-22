class SocialAccount < ApplicationRecord
  validates :title, :body, :login, :password, presence: true
  belongs_to :user
  #has_many :account_transfers, foreign_key: "transferable_id", dependent: :destroy
  has_many :account_transfers, as: :transferable#, foreign_key: "transferable_id", dependent: :destroy
end
