class SocialAccount < ApplicationRecord
  validates :title, :body, :login, :password, presence: true
  belongs_to :user
  has_many :account_transfers, as: :transferable, dependent: :destroy
end
