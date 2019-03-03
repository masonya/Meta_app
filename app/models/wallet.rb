class Wallet < ApplicationRecord

  # belongs_to :user
  validates :title, :body, :login, :password, :presence => true

  belongs_to :user

end
